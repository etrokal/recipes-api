with AWS.Server;
with AWS.Status;

package Server.Router is
  function Handle_Route(Request: AWS.Status.Data) return AWS.Response.Data;
end Server.Router;
