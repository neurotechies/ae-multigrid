% Initialize Matlab environment.
function startup
   % initialize matlab paths
   wd = cd;            % working directory
   addpath(wd);
   % pb
   addpath(fullfile(wd,'grouping','lib'));
   % globalization
   addpath(fullfile(wd,'globalization'));
   % ispc
   addpath(fullfile(wd,'ispc'));
   % scripts
   addpath(fullfile(wd,'scripts'));
   % utilities
   addpath(fullfile(wd,'util'));
end
