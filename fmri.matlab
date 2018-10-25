if isdeployed,
    return
else

self=mfilename;
matlabver = version('-release');
cself=[mfilename('fullpath'),'_', matlabver , '_cache.m'];
[~, snewer]=system(['test ', cself, ' -nt ', self ' && echo 1 || echo 0']);
if 1==str2num(snewer), %if cache is newer than me
    fprintf(2, 'Loading cached startup path: %s\n', cself);
    %load cache
    pd=pwd;  [pathn, scriptn]=fileparts(cself);
    cd(pathn); 
    eval(sprintf('npath=%s;', scriptn)); path(npath);
    addpath(pathn);  
    cd(pd);
    clear self snewer cself pd pathn scriptn npath
    return
end %if cself does not exist, it is Ok, system will think it fails to be newer!

%------------ FreeSurfer -----------------------------%
fshome = getenv('FREESURFER_HOME');
fsmatlab = sprintf('%s/matlab',fshome);
if (exist(fsmatlab) == 7)
    path(path,fsmatlab);
end
clear fshome fsmatlab;
%-----------------------------------------------------%

%------------ FreeSurfer FAST ------------------------%
fsfasthome = getenv('FSFAST_HOME');
fsfasttoolbox = sprintf('%s/toolbox',fsfasthome);
if (exist(fsfasttoolbox) == 7)
    path(path,fsfasttoolbox);
end
clear fsfasthome fsfasttoolbox;
%-----------------------------------------------------%

user=getenv('USER'),
node=getenv('HOSTNAME'),
%if strcmp(user, 'xst833'),
if ismember(user, {'xst833', 'tbp688', 'dawnsong', 'songx4'})
    home = getenv('HOME'),
else
    home = '/home/xst833/';
end

fmriTools={
'fmri/afni.matlab';
'fmri/bct.20121204';
'fmri/nbs1.2';
'fmri/gretna';
% 'spm12';
% 'spm12/toolbox/cat12';
'fmri/spm8';
'fmri/spm8/toolbox/vbm8';
'fmri/surfstat';
'fmri/panda/PANDA';
'matlab/gift/GroupICATv4.0a/icatb';
'matlab/simtb_v18';
'matlab/rest/REST';
'matlab/mlsp';
'matlab/m2thml';
'matlab/BrainNetViewer';
'matlab/eig3';
'matlab/export_fig';
'matlab/ite/code';
'matlab/jsonlab';
%'matlab/MIToolbox';
};
for i=1:size(fmriTools, 1),
    dir=sprintf(['%s/' fmriTools{i}], home);
    if exist(dir, 'dir'),
        addpath(genpath(dir));
        fprintf(2, sprintf('# Added path: %s\n', dir));
    else
        fprintf(2, sprintf('## Cannot find dir: %s\n', dir));
    end
end

%add my bin path
dawnbind= getenv('DAWNBIND');
addpath(genpath(dawnbind));
clear home fmriTools;

fprintf(2, sprintf('#Cleaning .git .svn dirs\n'));
%function filter_path(pattern)
pattern={'.git', '.svn'};
all = path;
[entries] = regexp(all, '([^:]+):', 'tokens');
for i = 1:length(entries)
    entry = char(entries{i});
    for j=1:length(pattern),
         if (~isempty(strfind(entry, pattern{j})))
             rmpath(entry);
         end;
    end
end;
clear all pattern entry entries;


savepath(cself)
clear self cself snewer
%else %~isdeployed
%    fprintf('I am deployed')
end 
