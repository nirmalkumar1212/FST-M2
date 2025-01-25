-- Load the CSV file
dialoguetable = LOAD '/root/inputs' USING PigStorage('\t') AS (character:chararray, dialogues:chararray);
-- Group data using the country column
GroupByDialogue = GROUP dialoguetable BY character;
-- Generate result format
CountBynames = FOREACH GroupByDialogue GENERATE $0 AS names, COUNT($1) AS no_of_dialogues; 
OrderByNames = ORDER CountBynames BY no_of_dialogues DESC;
-- To remove the old output folder
rmf /root/PigProjectOutput;
-- Save result in root folder
STORE OrderByNames INTO '/root/PigProjectOutput' USING PigStorage('\t');
