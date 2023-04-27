
$(function(){
  var nodes = new vis.DataSet([

    { id: 1, label: "192.168.124.141" },
    { id: 2, label: "192.168.124.4" },
    { id: 3, label: "192.168.124.6" },
    { id: 4, label: "192.168.124.2" },
    { id: 5, label: "192.168.124.10" }
  ]);

  // create an array with edges
  var edges = new vis.DataSet([
    { from: 1, to: 3 },
    { from: 1, to: 2 },
    { from: 2, to: 4 },
    { from: 2, to: 5 },
    { from: 3, to: 3 }
  ]);
  // create a network
  var container = document.getElementById("mynetwork");
  var data = {
    nodes: nodes,
    edges: edges
  };
  var options = {};
  var network = new vis.Network(container, data, options);
});


$(function(){
  var ssmsno = document.getElementById("notice").getAttribute("value");
  if (ssmsno === "Ssm was successfully updated."){
    sweetAlert(ssmsno);
  }
});
