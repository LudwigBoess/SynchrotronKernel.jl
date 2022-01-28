# SynchrotronKernel.jl

```@meta
CurrentModule = SynchrotronKernel
DocTestSetup = quote
    using SynchrotronKernel
end
```

This package computes the synchrotron kernel for a frequency ratio ``x = \frac{\nu}{\nu_0}`` and its polarisation components.


```@eval

using SynchrotronKernel
using CairoMakie

Nbins = 1_000
x = 10.0 .^ (LinRange(-10, 2, Nbins))

F = synchrotron_kernel.(x)

sk_ort = Vector{Float64}(undef, Nbins)
sk_par = Vector{Float64}(undef, Nbins)
for i = 1:Nbins 
    sk_ort[i], sk_par[i] = synchrotron_polarisation(x[i])
end

fs    = 25
scale = 550
fig   = Figure(resolution = (2.1*scale, scale), fontsize=fs)

ax_l = Axis(fig[1, 1], xlabel="x", ylabel="F(x)")
xlims!(ax_l, (0.0,10.0))
ylims!(ax_l, (0.0,1.0))
lines!(ax_l, x, F, label=L"F", color="black")
lines!(ax_l, x, sk_ort, label=L"F_{\perp}", color="black", linestyle=:dash)
lines!(ax_l, x, sk_par, label=L"F_{\parallel}", color="black", linestyle=:dot)

axislegend(framevisible=false)

ax_r = Axis(fig[1, 2], xlabel = "x", ylabel = "F(x)", 
            xscale=log10, yscale=log10)
xlims!(ax_r, (1.e-10,100))
ylims!(ax_r, (1.e-6,10.0))
lines!(ax_r, x, F, label=L"F", color="black")
lines!(ax_r, x, sk_ort, color="black", linestyle=:dash)
lines!(ax_r, x, sk_par, label=L"F_{\para}", color="black", linestyle=:dot)

save("kernels.png", fig); nothing # hide
```

![kernels](kernels.png)

# Simple interface

If you simply need to calculate the synchrotron kernel and the polarisation components you can use the following functions

## Synchrotron Kernel

```@docs
synchrotron_kernel
```

## Polarisation

```@docs
synchrotron_polarisation
```

# Synchrotron Functions

If you need to access the individual synchrotron functions you can use the direct interface.

## First Function


```@docs
ℱ
```

```@docs
SynchrotronKernel.F
```

## Second Function

```@docs
𝒢
```

```@docs
SynchrotronKernel.G
```
