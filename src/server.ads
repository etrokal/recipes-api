with AWS.Response;
with AWS.Server;
with AWS.Status;

package Server is

  WS: AWS.Server.HTTP;
  procedure Start_Server;

end Server;
