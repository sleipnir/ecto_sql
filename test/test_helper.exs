# For tasks/generators testing
Mix.start()
Mix.shell(Mix.Shell.Process)
System.put_env("ECTO_EDITOR", "")
Logger.configure(level: :info)

Code.require_file("test_repo.exs", __DIR__)
Code.require_file("../integration_test/support/file_helpers.exs", __DIR__)
ExUnit.start()

if function_exported?(ExUnit, :after_suite, 1) do
  ExUnit.after_suite(fn _ -> Mix.shell(Mix.Shell.IO) end)
end
