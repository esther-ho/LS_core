require_relative 'advice'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when "/"
      template = File.read 'views/index.erb'
      content = ERB.new(template)
      [
        '200',
        {'Content-Type' => 'text/html'},
        [content.result]
      ]
    when "/advice"
      piece_of_advice = Advice.new.generate
      template = File.read 'views/advice.erb'
      content = ERB.new(template)
      [
        '200',
        {'Content-Type' => 'text/html'},
        [content.result(binding)]
      ]
    else
      template = File.read 'views/not_found.erb'
      content = ERB.new(template)
      [
        '404',
        {'Content-Type' => 'text/html', 'Content-Length' => '73'},
        [content.result]
      ]
    end
  end
end
