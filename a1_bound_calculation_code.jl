### A Pluto.jl notebook ###
# v0.20.17

using Markdown
using InteractiveUtils

# ╔═╡ 45ae6434-c8e5-11f0-21c1-b92ce52ac069
using QuadGK

# ╔═╡ b25fe461-41db-4404-8630-3a08fa06de7f
begin
    using Printf

    # Computes the interval value at midpoint
    function I_of_p(p)
        integrand(y) = sqrt((1 - y) / (p^2 + y))
        val, err = quadgk(integrand, 0.0, 1.0; rtol=1e-6, atol=1e-6)
        return val, err
    end

    function solve_p0(a, b; tol=1e-10, maxiter=50)
        val_a, _ = I_of_p(a)
        fa = val_a - 1
        val_b, _ = I_of_p(b)
        fb = val_b - 1

        if fa * fb > 0
            error("Bisection interval does not bracket the root.")
        end

        for iter in 1:maxiter
            m = (a + b) / 2
            val, err = I_of_p(m)
            fm_interval_lo = val - err
            fm_interval_hi = val + err

            @printf("Iter %d: m = %.10f   Integral[m] ∈ [%.12f, %.12f]\n", iter, m, fm_interval_lo, fm_interval_hi)

            fm = val - 1
            if abs(fm) < tol
                println("Converged at iter $iter: root ≈ $m; Integral ∈ [$fm_interval_lo, $fm_interval_hi]")
                return a, b, (fm_interval_lo, fm_interval_hi)
            end

            if fa * fm < 0
                b = m
                fb = fm
            else
                a = m
                fa = fm
            end
        end

        println("Max iterations reached. Interval [$a, $b], last Integral ∈ [$fm_interval_lo, $fm_interval_hi]")
        return a, b, (fm_interval_lo, fm_interval_hi)
    end

    # Run
    p_a, p_b, (lo, hi) = solve_p0(-0.5, 0.0)
    println("\nRoot lies in [$p_a, $p_b] with last Integral ∈ [$lo, $hi]")
end


# ╔═╡ 88bcbd18-b0c4-4dd1-ad70-cf540bf2e4f1
begin
	function I_of_p_1(p)
    	integrand(y) = sqrt((1 - y) / (p^2 + y))
	    val, _ = quadgk(integrand, 0.0, 1.0; rtol=1e-6, atol=1e-6)
    	return val
	end

	function solve_p0_1(a, b; tol=1e-6, maxiter=50)
    	fa = I_of_p_1(a) - 1
    	fb = I_of_p_1(b) - 1    
    	if fa * fb > 0
        	error
    	end
    	for iter in 1:maxiter
        	m = (a + b) / 2
        	fm = I_of_p_1(m) - 1
        	@info "iter=$iter  p=$m   I(p)-1=$(fm)"
        	if abs(fm) < tol
            	return m
        	end
        	if fa * fm < 0
            	b = m
            	fb = fm
        	else
            	a = m
            	fa = fm
        	end
    	end
    	return (a + b) / 2
	end

# -------------------
# Run solver
# -------------------

	p0 = solve_p0_1(-0.5, 0.0)
	println("\nSolution p(0) = $p0")
end

# ╔═╡ 93d9fe98-4e76-447e-8799-eec1fc9b91c9
begin

	f(x) = sin(x + exp(x))
	val, err = quadgk(f, 0.0, 8.0)
	@printf("Integral : %.10f\n", val)
	@printf("Error bound: %.10e\n", err)
	@printf("Interval containing the integral: [%.10f, %.10f]\n", val - err, val + err)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"
QuadGK = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"

[compat]
QuadGK = "~2.11.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.6"
manifest_format = "2.0"
project_hash = "6b3ca669bb32dabf0a6f9b992ce8b903b999d242"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.DataStructures]]
deps = ["OrderedCollections"]
git-tree-sha1 = "6c72198e6a101cccdd4c9731d3985e904ba26037"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.19.1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "9da16da70037ba9d701192e27befedefb91ec284"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.11.2"

    [deps.QuadGK.extensions]
    QuadGKEnzymeExt = "Enzyme"

    [deps.QuadGK.weakdeps]
    Enzyme = "7da242da-08ed-463a-9acd-ee780be4f1d9"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╠═45ae6434-c8e5-11f0-21c1-b92ce52ac069
# ╠═88bcbd18-b0c4-4dd1-ad70-cf540bf2e4f1
# ╠═b25fe461-41db-4404-8630-3a08fa06de7f
# ╠═93d9fe98-4e76-447e-8799-eec1fc9b91c9
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
