Multigrid Angular Embedding Eigensolver
---------------------------------------

This software implements the multigrid eigensolver described in:

> [Progressive Multigrid Eigensolvers for Multiscale Spectral Segmentation]
> (http://ttic.uchicago.edu/~mmaire/papers/pdf/seg_multigrid_iccv2013.pdf)  
> Michael Maire and Stella X. Yu  
> International Conference on Computer Vision (ICCV), 2013  

It also serves as a core component of the simultaneous segmentation and
figure/ground organization system described in:

> [Affinity CNN: Learning Pixel-Centric Pairwise Relations for Figure/Ground Embedding]
> (http://arxiv.org/abs/1512.02767)  
> Michael Maire, Takuya Narihira, and Stella X. Yu  
> Computer Vision and Pattern Recognition (CVPR), 2016  

Demo - Multiscale Segmentation (ICCV 2013)
------------------------------------------

Run `demo.m` from MATLAB for a multiscale image segmentation demo.

Demo - Figure/Ground (CVPR 2016)
--------------------------------

Run `ae_cnn_demo.m` from MATLAB for a segmentation+figure/ground demo.  
Note that this demo runs in single-grid compute mode.

See `util/bench_fg.m` for figure/ground benchmark evaluation code.

Notes
-----

The current implementation is efficient for image sizes (length and width)
divisible by 2^(s-1), where s is the number of pyramid levels.  See the
included `multiscale_resize.m` function for padding arbitrary images to the
nearest efficient size.

ISPC
----

The `ispc/` subdirectory contains a sparse matrix times dense matrix multiply
routine that is significantly faster than Matlab's built-in operation on
machines supporting the AVX instruction set (most processors released in
2011 or later).

Uncomment `use_ispc = 1;` in `demo.m` to use this implementation.  It relies
on an included precompiled Linux mex file.  To compile for other architectures,
download ISPC from <http://ispc.github.io/> and run `build.sh`.

Citation
--------

If you make use of this software, please cite the following in any publications:

    @inproceedings{MY:ICCV:2013,
        title     = {Progressive Multigrid Eigensolvers for Multiscale Spectral Segmentation},
        author    = {Michael Maire and Stella X. Yu},
        booktitle = {International Conference on Computer Vision (ICCV)},
        year      = {2013}
    }

If you make use of our figure/ground component, please also cite:

    @inproceedings{MNY:CVPR:2016,
        title     = {Affinity CNN: Learning Pixel-Centric Pairwise Relations for Figure/Ground Embedding},
        author    = {Michael Maire and Takuya Narihira and Stella X. Yu},
        booktitle = {Computer Vision and Pattern Recognition (CVPR)},
        year      = {2016}
    }

License
-------

Copyright (C) 2013-2016 Michael Maire <mmaire@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

External Dependencies
---------------------

The image segmentation demo relies on local contour cues computed using the
Berkeley contour detector (Pb).  A version of this software is included in the
`grouping/` subdirectory.  For more information see:

http://www.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html
