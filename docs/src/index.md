# SynchrotronKernel.jl

```@meta
CurrentModule = SynchrotronKernel
DocTestSetup = quote
    using SynchrotronKernel
end
```

This package computes the synchrotron kernel for a frequency ratio ``x = ν/ν_0`` and its polarisation components.


```@eval

using SynchrotronKernel
using CairoMakie

main_theme = Theme(
    fontsize=20,
    Axis = ( xticksmirrored=true,
    yticksmirrored=true,
    xminorticksvisible=true,
    yminorticksvisible=true,
    xminortickalign=1,
    yminortickalign=1,
    xtickalign=1,
    ytickalign=1,
    xgridvisible = false,
    ygridvisible = false
    )
    )
merged_theme = merge(main_theme, theme_latexfonts())
set_theme!(merged_theme)

Nbins = 1_000
x = 10.0 .^ (LinRange(-10, 2, Nbins))

F      = Vector{Float64}(undef, Nbins)
sk_ort = Vector{Float64}(undef, Nbins)
sk_par = Vector{Float64}(undef, Nbins)
for i = 1:Nbins
    F[i], sk_ort[i], sk_par[i] = synchrotron_kernel(x[i])
end

scale = 550
fig   = Figure(size = (2.1*scale, scale))

ax_l = Axis(fig[1, 1], xlabel="x", ylabel="K(x)")
xlims!(ax_l, (0.0,10.0))
ylims!(ax_l, (0.0,1.0))
lines!(ax_l, x, F, label=L"K", color="black")
lines!(ax_l, x, sk_ort, label=L"K_{\perp}", color="black", linestyle=:dash)
lines!(ax_l, x, sk_par, label=L"K_{\parallel}", color="black", linestyle=:dot)

axislegend(framevisible=false)

ax_r = Axis(fig[1, 2], xlabel = "x", ylabel = "K(x)",
            xscale=log10, yscale=log10,
            xminorticks = IntervalsBetween(10), yminorticks = IntervalsBetween(10))
xlims!(ax_r, (1.e-8,50))
ylims!(ax_r, (1.e-6,10.0))
lines!(ax_r, x, F, label=L"F", color="black")
lines!(ax_r, x, sk_ort, color="black", linestyle=:dash)
lines!(ax_r, x, sk_par, label=L"F_{\parallel}", color="black", linestyle=:dot)

save("kernels.png", fig); nothing # hide
```

![kernels](kernels.png)

## Simple interface

If you simply need to calculate the synchrotron kernel and the polarisation components you can use the following functions

### Synchrotron Kernel

```@docs
synchrotron_kernel
```

### Intensity

```@docs
synchrotron_intensity
```

### Polarisation

```@docs
synchrotron_polarisation
```

## Synchrotron Functions

If you need to access the individual synchrotron functions you can use the direct interface.

### First Function


```@docs
ℱ
```

```@docs
SynchrotronKernel.F
```

### Second Function

```@docs
𝒢
```

```@docs
SynchrotronKernel.G
```
