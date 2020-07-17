# SynchrotronKernel.jl

```@meta
CurrentModule = SynchrotronKernel
DocTestSetup = quote
    using SynchrotronKernel
    using PyPlot
    using LaTeXStrings

    function axis_ticks_styling!(ax; size_minor_ticks::Int64=6, tick_label_size::Int64=15, color::String="k")

        ax.tick_params(reset=true, direction="in", axis="both", labelsize=tick_label_size,
                        which="major", size=size_minor_ticks<<1, width=1, color=color)
        ax.tick_params(reset=true, direction="in", axis="both", labelsize=tick_label_size,
                        which="minor", size=size_minor_ticks, width=1, color=color)

        ax.minorticks_on()

        return ax
    end

end
```

This package computes the first synchrotron function of a frequency ratio ``x = \frac{\nu}{\nu_0}`` .

``F(x) = x \int_x^\infty K_{\frac{5}{3}}(t) dt``.

```@example

using SynchrotronKernel # hide
using PyPlot # hide
using LaTeXStrings # hide
 
function axis_ticks_styling!(ax; size_minor_ticks::Int64=6, tick_label_size::Int64=15, color::String="k")   # hide
                                                                                                            # hide
    ax.tick_params(reset=true, direction="in", axis="both", labelsize=tick_label_size,                      # hide
                    which="major", size=size_minor_ticks<<1, width=1, color=color)                          # hide
    ax.tick_params(reset=true, direction="in", axis="both", labelsize=tick_label_size,                      # hide
                    which="minor", size=size_minor_ticks, width=1, color=color)                             # hide
                                                                                                            # hide
    ax.minorticks_on()                                                                                      # hide
                                                                                                            # hide
    return ax                                                                                               # hide
end                                                                                                         # hide

# set up log range from 1.e-10 - 1.e2
rng = -10.0:0.001:2
x = 10.0.^rng

F = synchrotron_kernel.(x)

fig = figure() # hide

ax = gca() # hide

axis_ticks_styling!(ax) # hide

ax.set_xscale("log") # hide
ax.set_yscale("log") # hide

ax.set_xlabel(L"\nu/\nu_0", fontsize=15) # hide
ax.set_ylabel(L"F(\nu/\nu_0)", fontsize=15) # hide

ax.set_ylim(1.e-6, 10.0) # hide
ax.set_xlim(1.e-10, 100.0) # hide

plot(x, F) # hide

savefig("synch.svg"); nothing # hide

```

![](synch.svg)