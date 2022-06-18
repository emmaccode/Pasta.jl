using Pkg; Pkg.activate(".")
using Toolips
using ToolipsSession
using Pasta

IP = "127.0.0.1"
PORT = 8000
extensions = [Logger(), Files("public"), Session()]
PastaServer = Pasta.start(IP, PORT, extensions)
