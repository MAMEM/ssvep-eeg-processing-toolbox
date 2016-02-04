# ssvep-eeg-processing-toolbox
## Description
This software is released as part of the EU-funded research project [MAMEM](https://www.mamem.eu/) for supporting experimentation in EEG signals generated using a SSVEP-based protocol.
It follows a modular architecture that allows the fast execution of experiments of different configurations with minimal adjustments of the code. The experimental pipeline consists of the **Experimenter** class which acts as a wrapper of five more underlying parts;

- The **Session** object: Used for loading the dataset and segmenting the signal according to the periods that the SSVEP stimuli were presented during the experiment. The signal parts are also annotated with a label according to the stimulus frequency.
- The **Preprocessing** object: Includes methods for modifying the raw EEG signal.
- The **Feature Extraction** object: Performs feature extraction algorithms for extracting numerical features from the EEG signals.
- The **Feature Selection** object: Selects the most important features that were extracted in the previous step.
- The **Classification** object: Trains a classification model for predicting the label of unknown samples

## Instructions
To use this framework you must have included the published [dataset files](http://www.mamem.eu/results/datasets/) in your Matlab path.
The usage of some classes of the framework is also limited by the following requirements.

| Package | Class | Description |
| --- | --- | --- |
| preprocessing | Amuse | .. |
| preprocessing | FastICA | Requires the [FastICA](http://research.ics.aalto.fi/ica/fastica/code/dlcode.shtml) library 
| aggregation | Vlad | Requires the [vlfeat](http://www.vlfeat.org/) library
| aggregation | Fisher | Requires the [vlfeat](http://www.vlfeat.org/) library
| featselection | FEAST | .. |
| classification | LIBSVMFast | Requires the [libsvm](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) library|
| classification | ... | ... |



