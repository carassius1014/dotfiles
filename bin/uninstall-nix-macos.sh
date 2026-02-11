#!/usr/bin/env bash

# Nix Uninstaller for macOS
# Based on: https://nix.dev/manual/nix/2.32/installation/uninstall

set -e

echo "=========================================="
echo "Nix Uninstaller for macOS"
echo "=========================================="
echo ""
echo "This script will remove Nix from your system."
echo "WARNING: This will delete all Nix packages and data!"
echo ""
read -p "Are you sure you want to continue? (yes/no): " -r
echo ""

if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
  echo "Uninstall cancelled."
  exit 0
fi

echo "Starting Nix uninstallation..."
echo ""

# Step 1: Restore shell configuration backups or remove Nix sections
echo "[1/7] Restoring shell configuration files..."

restore_or_warn() {
  local backup="$1"
  local original="${backup%.backup-before-nix}"

  if [ -f "$backup" ]; then
    sudo mv "$backup" "$original"
    echo "  ✓ Restored $original"
  else
    echo "  ⚠ No backup found for $original - you may need to manually remove Nix lines"
  fi
}

restore_or_warn "/etc/zshrc.backup-before-nix"
restore_or_warn "/etc/bashrc.backup-before-nix"
restore_or_warn "/etc/bash.bashrc.backup-before-nix"

echo ""

# Step 2: Stop and remove daemon services
echo "[2/7] Stopping and removing Nix daemon services..."

if [ -f /Library/LaunchDaemons/org.nixos.nix-daemon.plist ]; then
  sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist 2>/dev/null || true
  sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
  echo "  ✓ Removed nix-daemon service"
else
  echo "  ℹ nix-daemon service not found"
fi

if [ -f /Library/LaunchDaemons/org.nixos.darwin-store.plist ]; then
  sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist 2>/dev/null || true
  sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist
  echo "  ✓ Removed darwin-store service"
else
  echo "  ℹ darwin-store service not found"
fi

echo ""

# Step 3: Remove nixbld group and users
echo "[3/7] Removing nixbld group and build users..."

if sudo dscl . -read /Groups/nixbld >/dev/null 2>&1; then
  sudo dscl . -delete /Groups/nixbld
  echo "  ✓ Removed nixbld group"
else
  echo "  ℹ nixbld group not found"
fi

for u in $(sudo dscl . -list /Users | grep _nixbld || true); do
  sudo dscl . -delete /Users/$u
  echo "  ✓ Removed user $u"
done

echo ""

# Step 4: Edit fstab to remove Nix Store mount
echo "[4/7] Removing Nix Store mount from fstab..."

# Check if fstab exists and has nix entries
if [ -f /etc/fstab ]; then
  if grep -q "/nix" /etc/fstab; then
    # Create a temporary file without the nix line
    sudo grep -v "/nix" /etc/fstab > /tmp/fstab.tmp

    # Use vifs to safely update fstab
    # We need to provide the edited content to vifs via stdin
    if [ -s /tmp/fstab.tmp ]; then
      # fstab has other entries, update it
      sudo cp /tmp/fstab.tmp /etc/fstab.new
      sudo mv /etc/fstab.new /etc/fstab
      echo "  ✓ Removed Nix Store mount from fstab"
    else
      # fstab only had the nix entry, remove it entirely
      sudo rm /etc/fstab
      echo "  ✓ Removed fstab (only contained Nix entry)"
    fi

    rm -f /tmp/fstab.tmp
  else
    echo "  ℹ No Nix entries found in fstab"
  fi
else
  echo "  ℹ fstab not found"
fi

echo ""

# Step 5: Edit synthetic.conf
echo "[5/7] Removing Nix from synthetic.conf..."

if [ -f /etc/synthetic.conf ]; then
  if [ "$(cat /etc/synthetic.conf)" = "nix" ]; then
    # Only contains nix entry, remove the entire file
    sudo rm /etc/synthetic.conf
    echo "  ✓ Removed /etc/synthetic.conf"
  else
    # Has other entries, remove just the nix line
    if grep -q "^nix$" /etc/synthetic.conf; then
      sudo grep -v "^nix$" /etc/synthetic.conf > /tmp/synthetic.conf.tmp
      sudo cp /tmp/synthetic.conf.tmp /etc/synthetic.conf
      rm -f /tmp/synthetic.conf.tmp
      echo "  ✓ Removed 'nix' line from /etc/synthetic.conf"
    else
      echo "  ℹ No 'nix' line found in /etc/synthetic.conf"
    fi
  fi
else
  echo "  ℹ synthetic.conf not found"
fi

echo ""

# Step 6: Remove Nix files
echo "[6/7] Removing Nix files..."

sudo rm -rf /etc/nix
echo "  ✓ Removed /etc/nix"

sudo rm -rf /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels
echo "  ✓ Removed root Nix files"

rm -rf ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
echo "  ✓ Removed user Nix files"

echo ""

# Step 7: Remove Nix Store volume
echo "[7/7] Removing Nix Store volume..."
echo "  Checking for Nix Store volumes..."

if diskutil list | grep -q "Nix Store"; then
  echo "  Found Nix Store volume(s):"
  diskutil list | grep -A 5 "Nix Store"
  echo ""

  # Try to delete mounted volume at /nix
  if [ -d /nix ]; then
    echo "  Attempting to delete mounted Nix Store volume..."
    if sudo diskutil apfs deleteVolume /nix 2>/dev/null; then
      echo "  ✓ Deleted Nix Store volume"
    else
      echo "  ⚠ Could not delete Nix Store volume automatically"
      echo "  This usually means the volume is in use by the kernel"
      echo "  Please reboot and run: sudo diskutil apfs deleteVolume /nix"
    fi
  fi

  # Check for unmounted Nix Store volumes
  for volume_id in $(diskutil list | grep "Nix Store" | awk '{print $NF}'); do
    echo "  Attempting to delete volume $volume_id..."
    if sudo diskutil apfs deleteVolume "$volume_id" 2>/dev/null; then
      echo "  ✓ Deleted volume $volume_id"
    else
      echo "  ⚠ Could not delete volume $volume_id"
      echo "  Please run manually: sudo diskutil apfs deleteVolume $volume_id"
    fi
  done
else
  echo "  ℹ No Nix Store volumes found"
fi

echo ""
echo "=========================================="
echo "Nix uninstallation complete!"
echo "=========================================="
echo ""
echo "Notes:"
echo "  • The empty /nix directory will disappear after your next reboot"
echo "  • If the Nix Store volume couldn't be deleted, reboot and run:"
echo "    sudo diskutil apfs deleteVolume /nix"
echo "  • You may want to check these files for any remaining Nix references:"
echo "    - ~/.zshrc"
echo "    - ~/.bashrc"
echo "    - ~/.profile"
echo ""
