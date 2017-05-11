### API

This provides the lowest level access to an interface marked as external. Each of the external interface is exported as a raw stream_buffer and can be written to from a C/C++ Api. In order to use it, the context has to be generated as a shared library. The resulting shared library can be loaded by an external system using `[dlopen](http://man7.org/linux/man-pages/man3/dlopen.3.html)` explicitly or linked against using the `api.h` file that is generated in the public folder.

#### Walkthrough

- For the purpose of demonstration in this walkthrough, we will use a simple function included in vsi_examples repository. Using git, clone the vsi_examples repository: `https://github.com/systemviewinc/vsi-examples.git`.
- Create a new project and work through the wizard to the end. Select any part/board as it won't matter since we're only going to be using the software for the walkthrough.
- Click `menu->flow->Create Platform`. Accept the prefilled default options and Press okay.
- Click `menu->flow->Create Context`. Change the dropdown to `Software` and enter name as `api_walkthrough`. Press okay.
- Open Context block properties by double clicking inside `api_walkthrough` and scroll down to `Software Parameters->map exposed interfaces as`. Make sure that `Api` is selected.
- Scroll down to `C/C++ options` and ensure that `-static` flag is NOT included in `C` or `C++` compile options. Remove it if you see it included.
- Open the `Builds` dropdown and select Shared Library.
- Press okay to close the properties dialog.
- Select `menu->Flow->Compile Platform`.
- Then create a system canvas by selecting `flow->create system`. Accept the prefilled defaults.
- Open the newly created system canvas and select `menu->Flow->Import Platform`
- Double click the `api_walkthrough` context to enter hierarchy.
- Add a new `VSI Software Wizard` block by right clicking and selecting `VSI Software Wizard`.
- Open newly added block properties by double-clicking it.
- Click browse beside `Source Directory` and browse to select source code directory `<vsi_examples>/example_1`.
- The `C/C++ Function` dropdown box should be populated with multiple entries. Open and select `process_tcp1`.
- Enable `Execution Trigger` for `Arg 1` in Arguments section.
- Change the direction of `Arg 2` in Arguments section to `output`. Press okay to close properties.
- Right click each interface and select `Mark External`.
- Select `flow->Generate System`.
- Select `flow->Build Software Contexts` and then Select `Build`.
- Wait for the build to successfully complete.
- Browse to the directory `<project_dir>/vsi_auto_gen/sw/system_1` in a terminal.
- VSI automatically generate an example executable to demonstrate the api usage. Run the example by using the following command `./build/api_walkthrough/bin/api_walkthrough_example`
- The example will write to each input interface marked external and then read from each output marked external A statement on console is printed for each read and write.

## Exercise
- Analyze the example code for API walkthrough in `<project_dir>/vsi_auto_gen/sw/system_1/api_walkthrough/example`. Modify it to read data from a file instead of a variable and write to the input interface.
