class MessagesController < ApplicationController
  before_filter :set_cache_buster

  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/javascript'
  end
  #### crear message

  def create
    response.headers["Content-Type"] = "text/javascript"
    @conversation = Conversation.find(params[:conversation])

    @m = !params[:message].empty?
    if @m
      @message = Message.new
      @message.talker = @conversation.user if !@conversation.user.nil? && !current_user.nil?
      @message.talker = @conversation.customer if !@conversation.customer.nil? && current_user.nil?
      @message.conversation = @conversation
      @message.message = params[:message]
      @message.save

      puts @message.talker_type

      json_parce_for_chat = {message_act: @message.to_json, user_x: @message.talker.to_json}
      $redis.publish('messages.create', json_parce_for_chat.to_json)
    end

    respond_to do |format|
      format.json { render json: @message.to_json }
    end

  end

  def paginate_messages
    @page = params[:pages].to_i + 1
    @cite = CiteDoctor.find(params[:ident_i])
    @messages = @cite.message_user_to_users.paginate(:page => @page, :per_page => 5).order('created_at DESC')
    respond_to do |format|
      format.js
    end
  end

  def events
    response.headers["Content-Type"] = "text/event-stream"
    sse = SSE.new(response.stream, retry: 300, event: "event-name")
    start = Time.zone.now
    redis = Redis.new(:host => "127.0.0.1", :port => 6379)
    ticker = Thread.new {loop{sse.write 0; sleep 5 }}
    sender = Thread.new do
      redis.psubscribe('messages.*') do |on|
        on.pmessage do |pattern, event, data|
          response.stream.write("event: #{event}\n")
          response.stream.write("data: #{data}\n\n")
        end
      end
    end
    ticker.join
    sender.join
    rescue IOError
    ensure
    Thread.kill(ticker) if ticker
    Thread.kill(sender) if sender
    sse.close
    redis.quit
    response.stream.close
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
