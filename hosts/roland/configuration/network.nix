{
  networking = {
    hostName = "roland";
    firewall = {
      allowedUDPPorts = [ 22 80 443 27015 ];
      allowedTCPPorts = [ 22 80 443 27015 ];
      allowPing = true;
    };
  };
}
