<img src= "https://github.com/emmettgb/Pasta.jl/blob/main/public/Spaghetti5.png" width = 100></img>
## Pasta.jl
Pasta.jl is another toolips example; this time showing off full-stack capabilities and styling. \
**ensure you have Toolips.jl 0.1.0 before trying to start this app!** If you do Pkg.add("Toolips") and get version 0.0.9, then you will need to add Toolips#Unstable. As of right now, you will also need to add ToolipsSession.
```julia
(@v1.7) pkg> add Toolips#Unstable
    Updating git-repo `https://github.com/ChifiSource/Toolips.jl.git`
    Updating registry at `~/.julia/registries/General.toml`
   Resolving package versions...
    Updating `~/.julia/environments/v1.7/Project.toml`
  [a47e2ad8] + Toolips v0.1.0 `https://github.com/ChifiSource/Toolips.jl.git#Unstable`

(@v1.7) pkg> add http://github.com/ChifiSource/ToolipsSession.jl
     Cloning git-repo `http://github.com/ChifiSource/ToolipsSession.jl`
    Updating git-repo `http://github.com/ChifiSource/ToolipsSession.jl`
   Resolving package versions...
    Updating `~/.julia/environments/v1.7/Project.toml`
  [2fe55384] + ToolipsSession v0.1.0 `http://github.com/ChifiSource/ToolipsSession.jl#main`

(@v1.7) pkg> add https://github.com/emmettgb/Pasta.jl
    Updating git-repo `https://github.com/emmettgb/Pasta.jl`
   Resolving package versions...
    Updating `~/.julia/environments/v1.7/Project.toml`
  [3dcedf57] + Pasta v0.1.0 `https://github.com/emmettgb/Pasta.jl#main`
    Updating `~/.julia/environments/v1.7/Manifest.toml`
  [6f1432cf] + LoweredCodeUtils v2.2.2
  [3dcedf57] + Pasta v0.1.0 `https://github.com/emmettgb/Pasta.jl#main`
  [295af30f] + Revise v3.3.3
Precompiling project...
  1 dependency successfully precompiled in 1 seconds (159 already precompiled, 1 skipped during auto due to previous errors)

julia> using Pasta; Pasta.start()
[2022:06:18:16:28]: 🌷 toolips> Toolips Server starting on port 8000
[2022:06:18:16:28]: 🌷 toolips> Successfully started server on port 8000
[2022:06:18:16:28]: 🌷 toolips> You may visit it now at http://127.0.0.1:8000
```
<img src = https://github.com/emmettgb/Pasta.jl/blob/main/public/erfrefreger.png></img>
