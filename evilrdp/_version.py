__version__ = "0.0.3"
__banner__ = \
"""
# evilrdp %s 
# Author: Tamas Jos @skelsec (info@skelsecprojects.com)
""" % __version__
__examples__ = '''\
###  url Examples ###

rdp+kerberos-password://TEST\Administrator:Passw0rd!1@win2016ad.test.corp/?dc=10.10.10.2&proxytype=socks5&proxyhost=127.0.0.1&proxyport=1080
    CredSSP (aka HYBRID) auth using Kerberos auth + password via socks5 to 
    win2016ad.test.corp, the domain controller (kerberos service) is at 
    10.10.10.2. The socks proxy is on 127.0.0.1:1080

rdp+ntlm-password://TEST\Administrator:Passw0rd!1@10.10.10.103
    CredSSP (aka HYBRID) auth using NTLM auth + password connecting to RDP 
    server 10.10.10.103

rdp+ntlm-password://TEST\Administrator:<NThash>@10.10.10.103
    CredSSP (aka HYBRID) auth using Pass-the-Hash (NTLM) auth connecting to RDP
    server 10.10.10.103

rdp+plain://Administrator:Passw0rd!1@10.10.10.103
    Plain authentication (No SSL, encryption is RC4) using password connecting 
    to RDP server 10.10.10.103
'''