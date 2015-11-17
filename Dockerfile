FROM hypriot/rpi-ruby
RUN apt-get update -qq && apt-get install -y build-essential 

RUN mkdir /opt/events

# gem cache
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# rails
ADD . /opt/events
WORKDIR /opt/events
CMD ["ruby","bin/events", "start"]
