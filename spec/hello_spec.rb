require 'pry'
describe 'hello world' do
  it 'tests ruby hello world' do
    setup_aruba
    directory = '/path/to/aruba_starter/src'
    run("ruby #{directory}/hello_world.rb")

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to eq("hello world\n")
  end

  it 'tests python hello world' do
    setup_aruba
    directory = '/path/to/aruba_starter/src'
    run("python #{directory}/hello_world.py")

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to eq("hello world\n")
  end

  it 'tests shell hello world' do
    setup_aruba
    directory = '/path/to/aruba_starter/src'
    run("#{directory}/hello_world.sh")

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to eq("hello world\n")
  end

  it 'tests the adder' do
    setup_aruba
    directory = '/path/to/aruba_starter/src'

    number_1 = 1
    number_2 = 2
    number_3 = 3
    adder_output = "Enter a number:\n"\
                   "Enter another number:\n"\
                   "The sum of #{number_1} and #{number_2} is: #{number_3}\n"

    run("ruby #{directory}/adder.rb")
    type "#{number_1}"
    type "#{number_2}"

    stop_all_commands
    sleep(1)
    expect(last_command_started.output).to eq(adder_output)
  end
end
