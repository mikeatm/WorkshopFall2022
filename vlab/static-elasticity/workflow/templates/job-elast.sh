#!/bin/bash
#SBATCH --job-name="q-point"
## Change partition if needed
#SBATCH --partition=job
#SBATCH -A col146
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=1200M
#SBATCH --export=ALL
#SBATCH -t 128:40:00


### Run QE
mpirun --map-by core --mca btl_openib_if_include "mlx5_2:1" --mca btl openib,self,vader pw.x -input elast.in 1> elast.out 2> elast.err
