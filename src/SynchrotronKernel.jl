"""
    This implementation is based on the port from GSL to Python by
    J. Michael Burgess for his pynchrotron package:
    https://github.com/grburgess/pynchrotron
"""

module SynchrotronKernel

    include("constants.jl")

    export synchrotron_kernel

    @inline function cheb_eval(coeff::typeof([1.0]), order::Integer, a::Real, b::Real, x::Real)

        d = 0.0
        dd = 0.0

        y = (2x - a - b) / (b - a)
        y2 = 2y

        @inbounds for j = (order+1):-1:2
            temp = d
            d = y2 * d - dd + coeff[j]
            dd = temp
        end

        temp = d
        d = y * d - dd + 0.5 * coeff[1]

        return d
    end


    """
        synchrotron_kernel(x::Real)

    Computes the first synchrotron function at a given frequency ratio.

    """
    @inline function synchrotron_kernel(x::Real)

        if x < cond1

            z = x^(1/3)
            cf = 1 - 8.43812762813205e-01 * z * z
            return 2.14952824153447863671 * z * cf

        elseif x <= 4.0

            px = x^(1/3)
            px11 = px^11
            t = x^2 / 8.0 - 1.0
            result_c1 = cheb_eval( synchrotron1_data,
                                synchrotron1_cs_order,
                                synchrotron1_cs_a,
                                synchrotron1_cs_b,
                                t )

            result_c2 = cheb_eval( synchrotron2_data,
                                synchrotron2_cs_order,
                                synchrotron2_cs_a,
                                synchrotron2_cs_b,
                                t )

            return px * result_c1 - px11 * result_c2 - synch_c0 * x

        elseif x < cond3

            t = (12.0 - x) / (x + 4.0)

            result_c1 = cheb_eval( synchrotron1a_data,
                                synchrotron1a_cs_order,
                                synchrotron1a_cs_a,
                                synchrotron1a_cs_b,
                                t )

            return sqrt(x) * result_c1 * exp(c01 - x)

        else
            return 0.0
        end
    end

end # module
