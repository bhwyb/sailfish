
.PHONY: clean regtest2d_single regtest2d_double regtest3d_single regtest3d_double

regtest2d_single:
	python -u regtest/poiseuille.py --dim=2
	python -u regtest/poiseuille.py --dim=2 --drive=pressure
	python -u regtest/poiseuille.py --dim=2 --model=mrt
	python -u regtest/poiseuille.py --dim=2 --model=mrt --drive=pressure

regtest2d_double:
	python -u regtest/poiseuille.py --dim=2 --precision=double
	python -u regtest/poiseuille.py --dim=2 --precision=double --drive=pressure
	python -u regtest/poiseuille.py --dim=2 --model=mrt --precision=double
	python -u regtest/poiseuille.py --dim=2 --model=mrt --precision=double --drive=pressure

regtest3d_single:
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q13 --model=mrt --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q15 --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q15 --model=mrt --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q19 --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q19 --model=mrt --bc=fullbb

regtest3d_double:
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q13 --model=mrt --precision=double --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q15 --precision=double --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q15 --model=mrt --precision=double --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q19 --precision=double --bc=fullbb
	python -u regtest/poiseuille.py --dim=3 --grid=D3Q19 --model=mrt --precision=double --bc=fullbb

regtest3d_drag:
	python -u regtest/drag_coefficient.py --grid=D3Q13 --model=mrt
	python -u regtest/drag_coefficient.py --grid=D3Q15 --model=bgk
	python -u regtest/drag_coefficient.py --grid=D3Q15 --model=mrt
	python -u regtest/drag_coefficient.py --grid=D3Q19 --model=bgk
	python -u regtest/drag_coefficient.py --grid=D3Q19 --model=mrt

perf_plots:
	python perftest/make_plots.py perftest/2d_single.pdf perftest/results/GeForce_GTX_285 2d_sc 2d_ldc 2d_poiseuille
	python perftest/make_plots.py perftest/2d_binary.pdf perftest/results/GeForce_GTX_285 2d_bin
	python perftest/make_plots.py perftest/3d.pdf perftest/results/GeForce_GTX_285 3d_

perf_block_plots:
	python perftest/make_block_plots.py perftest perftest/results/GeForce_GTX_285/blocksize

test:
	python tests/geometry.py

clean:
	rm -f sailfish/*.pyc
	rm -f perftest/*.pdf
	rm -rf regtest/results


