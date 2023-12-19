with Server.Router;

package body Server is
  procedure Start_Server is
  begin
    AWS.Server.Start(WS, "App Name", Callback => Server.Router.Handle_Route'Unrestricted_Access);
  end Start_Server;
end Server;
