### RESTful API

A much more high level API can be used through RESTful interfaces. RESTful is a semi-official standard used throughout cloud/web infrastructure and Visual System Integrator provides a simple way to plug an FPGA/Embedded workflow into the rich ecosystem effortlessly while retaining the high performance promised by VSI.

#### Walkthrough

- For the purpose of demonstration in this walkthrough, we will use a simple function included in vsi_examples repository. Using git, clone the vsi_examples repository: `https://github.com/systemviewinc/vsi-examples.git`.
- We will also need a RESTful server in order to display the processed data. For this walkthrough, we will use a third- party library mongoose. Using git, clone the repository `https://github.com/cesanta/mongoose.git` locally.
- In a terminal, enter the `examples` directory in cloned repository and run `make`. This will build the example projects.
- Enter the `restful_server` directory and run `./restful_server`. This will startup the restful server on port 8000 locally.
- Create a new project and work through the wizard to the end. Select any part/board as it won't matter since we're only going to be using the software for the walkthrough.
- Click `menu->flow->Create Platform`. Accept the prefilled default options and Press okay.
- Click `menu->flow->Create Context`. Change the dropdown to `Software` and enter name as `rest_walkthrough`. Press okay.
- Open Context block properties by double clicking inside `rest_walkthrough` and scroll down to `Software Parameters->map exposed interfaces as`. Make sure that `RESTful Endpoints` is selected.
- Press okay to close the properties dialog.
- Select `menu->Flow->Compile Platform`.
- Then create a system canvas by selecting `flow->create system`. Accept the prefilled defaults.
- Open the newly created system canvas and select `menu->Flow->Import Platform`
- Double click the `rest_walkthrough` context to enter hierarchy.
- Add a new `VSI Software Wizard` block by right clicking and selecting `VSI Software Wizard`.
- Open newly added block properties by double-clicking it.
- Click browse beside `Source Directory` and browse to select source code directory `<vsi_examples>/sort`.
- The `C/C++ Function` dropdown box should be populated with multiple entries. Open and select `sort` function.
- Enable `Execution Trigger` for `Arg 1` in Arguments section.
- Change the direction of `Arg 2` in Arguments section to `output` and access type to `Random`. Press okay to close properties.
- Right click each interface and select `Mark External`.
- Select `flow->Generate System`.
- Select `flow->Build Software Contexts` and then Select `Build`.
- Wait for the build to successfully complete.
- Browse to the directory `<project_dir>/vsi_auto_gen/sw/system_1` in a terminal.
- Run the system by using the following command `./build/rest_walkthrough/bin/rest_walkthrough`
- Open another terminal and enter the following command: `curl -H "Content-Type: application/json" -X POST -d '[{ "name": "rest_walkthrough::vsi_gen_ip_0::arg_2_seq_o", "type": "webhook", "target": "http://localhost:8000/printcontent"}]' http://localhost:1999/connect`. This sets the REST endpoint for the output interface which will be used to emit the processed data.
- Enter `printf "" > ~/sort.txt; for i in {1..256}; do printf "ABCDEFGH12345678" >> ~/sort.txt; done`. This will create a file with unsorted blob of alphanumeric data.
- Enter `curl -H "Content-Type: application/octet-stream" -X POST -d @/home/$USER/sort.txt http://localhost:1999/rest_walkthrough::vsi_gen_ip_0::arg_1_seq_i`. This will read the sort.txt file and push it to the input interface marked external.
- You should see part of processed data in the first terminal with the content sorted.
