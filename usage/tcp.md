### TCP Ports

This provides the simplest way to interface to a system that is not on the same machine. Each of the external interface is mapped to a TCP port and can be read from or written to.

#### Walkthrough

- For the purpose of demonstration in this walkthrough, we will use a simple function included in vsi_examples repository. Using git, clone the vsi_examples repository: `https://github.com/systemviewinc/vsi-examples.git`.
- Create a new project and work through the wizard to the end. Select any part/board as it won't matter since we're only going to be using the software for the walkthrough.
- Click `menu->flow->Create Platform`. Accept the prefilled default options and Press okay.
- Click `menu->flow->Create Context`. Change the dropdown to `Software` and enter name as `tcp_walkthrough`. Press okay.
- Open Context block properties by double clicking inside `tcp_walkthrough` and scroll down to `Software Parameters->map exposed interfaces as`. Make sure that `TCP Ports` is selected.
- Press okay to close the properties dialog.
- Select `menu->Flow->Compile Platform`.
- Then create a system canvas by selecting `flow->create system`. Accept the prefilled defaults.
- Open the newly created system canvas and select `menu->Flow->Import Platform`
- Double click the `tcp_walkthrough` context to enter hierarchy.
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
- Run the system by using the following command `./build/tcp_walkthrough/bin/tcp_walkthrough`
- Use a tcp client to connect to the input interface marked external. For this walkthrough, we'll use `netcat` as a TCP client. Enter the following command to run `netcat localhost 1999`.
- Open another terminal and enter `netcat localhost 2000`. This will connect to the output where you will see the processed data being emitted.
- Enter a blob of data < 256 Bytes and press enter.
- You should see the processed data in the second terminal.
