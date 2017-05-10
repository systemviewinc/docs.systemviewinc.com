## Java and Python support

Visual System Integrator 2017.1 and onwards provides builtin bindings for Python and Java. A user can use Python and/or Java to call FPGA core directly or go through an intermediary C/C++ block. In addition, a Python/Java callback can be initiated directly from FPGA. Moreover, a mix/match between Python, Java and C/C++ can be used in a single system<sup>1</sup>

This enables the user to easily integrate their existing workflow, utilize existing language expertise and third-party libraries effortlessly. It can also be used to integrate the VSI output with another system using one of the external language.

For experimentation and/or research, it allows a system architect to keep well-tested and established parts of the system in C/C++/FPGA while allowing rapid prototyping using Python or Java.


# Enabling External Language Support

Any version beyond VSI 2017.1 already has external language support.

# Walkthrough for Python

- For the purpose of demonstration in this walkthrough, we will use a simple python function included in vsi_examples repository. Using git, clone the vsi_examples repository: `https://github.com/systemviewinc/vsi-examples.git`.
- Create a new project and work through the wizard to the end. Select any part/board as it won't matter since we're only going to be using the software for the walkthrough.
- Click `menu->flow->Create Platform`. Accept the prefilled default options and Press okay.
- Click `menu->flow->Create Context`. Change the dropdown to `Software` and enter name as `python_test`. Press okay.
- Open Context block properties by double clicking inside `python test` and scroll down to `Software Parameters->language`
- Select the target language you intend to use for the context. For this walkthrough, we will use `Python`
- Ensure that `-static` flag is NOT included in `C` or `C++` compile options. Remove it if you see it included.
- Set the python version in `Python Options` section to 2.7x. Press okay to close the properties dialog.
- Select `menu->Flow->Compile Platform`.
- Then create a system canvas by selecting `flow->create system`. Accept the prefilled defaults.
- Open the newly created system canvas and select `menu->Flow->Import Platform`
- Double click the `python_test` context to enter hierarchy.
- (Optionally) Verify that the correct language is available in the desired context in System Canvas.
- Add a new `VSI Software Wizard` block by right clicking and selecting `VSI Software Wizard`.
- Open newly added block properties by double-clicking it.
- Change the `Source Language` in `Source Parameters` to `Python`.
- Click browse beside `Source Directory` and browse to select source code directory `<vsi_examples>/example_1`.
- The `Python Function` dropdown box should be populated with multiple entries. Open and select `process_stream`.
- Change the direction of `Arg 2` in Arguments section to `output`. Press okay to close properties.
- Add a new `VSI Software Wizard` block by right clicking and selecting `VSI Software Wizard`.
- Open newly added block properties by double-clicking it.
- Click browse beside `Source Directory` and browse to select source code directory `<vsi_examples>/example_1`.
- The `C/C++ Function` dropdown box should be populated with multiple entries. Open and select `process_tcp1`.
- Change the direction of `Arg 2` in Arguments section to `output`. Press okay to close properties.
- Drag and connect each input to output so that two blocks are connected together. i.e sbOut of python block should be connected to in1 of C/C++ block and sbIn of python block should be connected to out1 of C/C++ block.
- Select `flow->Generate System`.
- Select `flow->Build Software Contexts` and then Select `Build`.
- Wait for the build to successfully complete.
- Browse to the directory `<project_dir>/vsi_auto_gen/sw/system_1` in a terminal.
- Run the system by using the following command `python python_test/python/python_test_main.py`
- The example will send 256 bytes of data through each block. A statement on console is printed every 100,000 iteration.

# Walkthrough for Java

- For the purpose of demonstration in this walkthrough, we will use a simple java function included in vsi_examples repository. Using git, clone the vsi_examples repository: `https://github.com/systemviewinc/vsi-examples.git`.
- Create a new project and work through the wizard to the end. Select any part/board as it won't matter since we're only going to be using the software for the walkthrough.
- Click `menu->flow->Create Platform`. Accept the prefilled default options and Press okay.
- Click `menu->flow->Create Context`. Change the dropdown to `Software` and enter name as `java_test`. Press okay.
- Open Context block properties by double clicking inside `java test` and scroll down to `Software Parameters->language`
- Select the target language you intend to use for the context. For this walkthrough, we will use `java`
- Ensure that `-static` flag is NOT included in `C` or `C++` compile options. Remove it if you see it included.
- Set the java version in `java Options` section to 2.7x. Press okay to close the properties dialog.
- Select `menu->Flow->Compile Platform`.
- Then create a system canvas by selecting `flow->create system`. Accept the prefilled defaults.
- Open the newly created system canvas and select `menu->Flow->Import Platform`
- Double click the `java_test` context to enter hierarchy.
- (Optionally) Verify that the correct language is available in the desired context in System Canvas.
- Add a new `VSI Software Wizard` block by right clicking and selecting `VSI Software Wizard`.
- Open newly added block properties by double-clicking it.
- Change the `Source Language` in `Source Parameters` to `java`.
- Click browse beside `Source Directory` and browse to select source code directory `<vsi_examples>/example_1`.
- The `Java Function` dropdown box should be populated with multiple entries. Open and select `process_stream`.
- Change the direction of `Arg 2` in Arguments section to `output`.
- Change size for each `arg 1` and `arg 2` to be 256 bytes. Press okay to close properties.
- Add a new `VSI Software Wizard` block by right clicking and selecting `VSI Software Wizard`.
- Open newly added block properties by double-clicking it.
- Click browse beside `Source Directory` and browse to select source code directory `<vsi_examples>/example_1`.
- The `C/C++ Function` dropdown box should be populated with multiple entries. Open and select `test_java`.
- Change the direction of `Arg 2` in Arguments section to `output`. Press okay to close properties.
- Drag and connect each input to output so that two blocks are connected together. i.e sbOut of java block should be connected to inc of C/C++ block and sbIn of java block should be connected to out of C/C++ block.
- Select `flow->Generate System`.
- Select `flow->Build Software Contexts` and then Select `Build`.
- Wait for the build to successfully complete.
- Browse to the directory `<project_dir>/vsi_auto_gen/sw/system_1` in a terminal.
- Run the system by using the following command `java -classpath build/java_test/java/java_test.jar java_test_main`
- The example will send 256 bytes of data through each block. A statement on console is printed every 100,000 iteration.

## Exercise

- Try modifying the test string in example code and verify that the printed statement changes.
- Modify the iteration cycle when a statement is printed to 1,000,000.
- Change the design to have another python/java block.



### Footnotes
1. A single context can only support a mix of one external language and C/C++. For example Java and C/C++ or Python and C/C++. In order to use both Java and C++, a logical partitioning of contexts, each supporting an external language has to be used. VSI Software Interconnect can be used to seamlessly connect the two context without any handwritten code.
