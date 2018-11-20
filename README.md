# HideCHeck-ins
Analyzed a privacy leaking problem caused by mobile devices;
This is the readme file about the executable source code of the individual project ‘How to hide your check-ins?’. This program is developed by Qiang Lin, and thanks for Randy L. Haupt who provides the basic structure of the genetic algorithm.

The program is developed based on the MATLAB R2017b 9.3.0. Make sure you have the feasible version before using it. The main steps for using this program are shown as follows.
1.Unzip the file to any disk location.

2.The basic functions required to complete the algorithm include ‘LoadData.m’, ‘HideSensitive.m’, ‘GreedyHideForOne.m’, ‘GAHideForOne.m’, ’Cga.m’, ‘Djs.m’ and ‘CalculateJs.m’.

3.Open the ‘HideSensitive.m’. It is the main file of this program. Input the ID of the histogram that needs to be protected into the list ‘hiddenList =[]’. Click the ‘Run’ button and the algorithm will start. Related tips will be displayed in the command line window

4.When the algorithm finishes, the parallel pool will be shut down, and the total runtime will be displayed in the command window.

5.The JS divergence and runtime for each sanitized histogram can be checked in variable ‘bestJs’ and ‘useTime’ respectively.

6.Other functions can be activated or deactivated according to the comments in the code, such as ‘TextTransform.m’, ‘SanitizedHistogram.m’ and so on.

The datasets used in this project are covered by the provided txt or excel files, and the results of the designed experiments are provided in the ‘result_data’ folder.

If you have any question about this program, you can contact me with this email qiang.lin@kcl.ac.uk.

