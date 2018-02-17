defmodule Ravenx.Strategy.EmailTest do
  use ExUnit.Case, async: true

  import Mock

  alias Ravenx.Strategy.Email

  setup_all do
    %{
      payload: %{
        from: {"Foo", "foo@test.com"},
        to: [{"Bar", "bar@test.com"}],
        cc: [{"Bar2", "bar2@test.com"}],
        bcc: [{"Bar3", "bar3@test.com"}],
        subject: "This ios a subject!",
        text_body: "Hello",
        html_body: "<p>Hello</p>"
      },
      opts: %{
        adapter: :test
      }
    }
  end

  describe "Ravenx.Strategy.Email" do
    test "works as expected", %{payload: payload, opts: opts} do
      {result, response} = Email.call(payload, opts)

      assert result == :ok
      assert %Bamboo.Email{} = response
      assert response.from == payload[:from]
      assert response.to == payload[:to]
      assert response.cc == payload[:cc]
      assert response.bcc == payload[:bcc]
      assert response.text_body == payload[:text_body]
      assert response.html_body == payload[:html_body]
    end

    test "requires an adapter", %{payload: payload} do
      assert {:error, {:missing_config, :adapter}} == Email.call(payload, %{})
    end

    test "requires a valid adapter", %{payload: payload} do
      assert {:error, {:adapter_not_found, :wadus}} == Email.call(payload, %{adapter: :wadus})
    end

    test "requires :to in payload", %{payload: payload, opts: opts} do
      new_payload = Map.delete(payload, :to)
      assert {:error, {:missing_config, :to}} == Email.call(new_payload, opts)
    end

    test "requires :from in payload", %{payload: payload, opts: opts} do
      new_payload = Map.delete(payload, :from)
      assert {:error, {:missing_config, :from}} == Email.call(new_payload, opts)
    end

    test "can recognise errors", %{payload: payload, opts: opts} do
      with_mock Bamboo.Mailer,
        deliver_now: fn _, _, _ ->
          raise RuntimeError, "Ooops!"
        end do
        assert {:error, {:exception, _}} = Email.call(payload, opts)
      end
    end
  end
end
