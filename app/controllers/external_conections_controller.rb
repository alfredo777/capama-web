class ExternalConectionsController < ApplicationController
  def create(adpter = "mysql", host = "localhost", username = "myuser", password = "mypass", database = "somedatabase"  )
    $xternaldb = ActiveRecord::Base.establish_connection(
      :adapter  => adapter,
      :host     => host,
      :username => username,
      :password => password,
      :database => database
    )
  end
end
