
@inline @fastmath function cheb_eval(coeff::Vector{<:Real}, order::Integer, x::Real)

    d = 0.0
    dd = 0.0

    x2 = 2x

    @inbounds for j = order:-1:2
        temp = d
        d = x2 * d - dd + coeff[j]
        dd = temp
    end

    d = x * d - dd + 0.5 * coeff[1]

    return d
end


"""
    F(x::Real)

Computes the first synchrotron function at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.

``F(x) = x \\int_x^\\infty K_{\\frac{5}{3}}(t) dt``

"""
@inline function F(x::Real)

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
                            t )

        result_c2 = cheb_eval( synchrotron2_data,
                            synchrotron2_cs_order,
                            t )

        return px * result_c1 - px11 * result_c2 - synch_c0 * x

    elseif x < cond3

        t = (12.0 - x) / (x + 4.0)

        result_c1 = cheb_eval( synchrotron1a_data,
                            synchrotron1a_cs_order,
                            t )

        return sqrt(x) * result_c1 * exp(c01 - x)

    else
        return 0.0
    end
end
