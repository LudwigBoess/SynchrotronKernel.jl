"""
    This implementation is based on the port from GSL to Python by
    J. Michael Burgess for his pynchrotron package:
    https://github.com/grburgess/pynchrotron
"""

module SynchrotronKernel

    include("F.jl")
    include("G.jl")

    export synchrotron_kernel,
           synchrotron_intensity,
           synchrotron_polarisation,
           ℱ, 𝒢


    """
        synchrotron_kernel(x::Real)

    Computes the first synchrotron function and the polarisation components at a given frequency ratio ``x = \\frac{ν}{ν_0}``.
    Returns a tuple `(K_tot, K_ort, K_par)`.

    ```julia
    K_tot = F(x)
    K_ort = 0.5 * (F(x) + G(x))
    K_par = 0.5 * (F(x) - G(x))
    ```

    ## Synchrotron Functions
    ``F(x) = x \\int_x^∞ K_{\\frac{5}{3}}(t) dt``

    ``G(x) = x K_{\\frac{2}{3}}(x)``

    """
    function synchrotron_kernel(x::Real)
        # first synchrotron function
        K  = F(x)
        # second synchrotron function
        pK = G(x)

        # orthogonal and parallel polarisation components
        K_ort = 0.5 * (K + pK)
        K_par = 0.5 * (K - pK)

        return K, K_ort, K_par
    end


    """
        synchrotron_intensity(x::Real)

    Computes the total synchrotron kernel, without polarisation components.
    Wrapper for [`F`](@ref).

    ``F(x) = x \\int_x^∞ K_{\\frac{5}{3}}(t) dt``
    """
    synchrotron_intensity(x::Real) = F(x)

    """
        synchrotron_polarisation(x::Real)

    Computes the second synchrotron function at a given frequency ratio ``x = \\frac{ν}{ν_0}``.
    Returns a tuple of `(K_ort, K_par)`.

    ```julia
    K_ort = 0.5 * (F(x) + G(x))
    K_par = 0.5 * (F(x) - G(x))
    ```

    ## Synchrotron Functions
    ``F(x) = x \\int_x^∞ K_{\\frac{5}{3}}(t) dt``

    ``G(x) = x K_{\\frac{2}{3}}(x)``
    """
    function synchrotron_polarisation(x::Real)

        # first synchrotron function
        K  = F(x)
        # second synchrotron function
        pK = G(x)

        K_ort = 0.5 * (K + pK)
        K_par = 0.5 * (K - pK)

        # orthogonal and parallel polarisation components
        return K_ort, K_par
    end


    using SnoopPrecompile    # this is a small dependency

    @precompile_setup begin
        # Putting some things in `setup` can reduce the size of the
        # precompile file and potentially make loading faster.

        @precompile_all_calls begin
            # all calls in this block will be precompiled, regardless of whether
            # they belong to your package or not (on Julia 1.8 and higher)

            for f ∈ [1.e-8, 1.0, 3.5, 4.5, 10.0, 50.0, 100.0, 1.e6]
                ℱ(f)
            end

            𝒢(1.0)

            synchrotron_kernel(1.0)
            synchrotron_intensity(1.0)
            synchrotron_polarisation(1.0)

        end
    end
end # module
