function fisheriris_modif = importardatos(filename, dataLines)
%IMPORTFILE Import data from a text file
%  FISHERIRIS_MODIF = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a table.
%
%  FISHERIRIS_MODIF = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  fisheriris_modif = importardatos("C:\Users\garellan\MathWorks\LATAM Team - Documents\2025\Events 2025\01_UCatolicaTemuco\MachineLearningAgriculture\fisheriris_modif.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 08-Jan-2025 11:44:03

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["SepalLength", "SepalWidth", "PetalLength", "PetalWidth", "Species"];
opts.VariableTypes = ["double", "double", "double", "double", "categorical"];

% Specify file level properties
opts.ImportErrorRule = "error";
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "Species", "EmptyFieldRule", "auto");

% Import the data
fisheriris_modif = readtable(filename, opts);

end