FROM elixir:latest

ENV WORKDIR /blitzbot
# ARG MIX_ENV

ARG BOT_TOKEN
ENV BOT_TOKEN $BOT_TOKEN

RUN echo $BOT_TOKEN

WORKDIR $WORKDIR

# TODO: Do I need it?
RUN mix local.hex --force
RUN mix local.rebar --force

COPY mix.* ./

RUN mix deps.get --only prod
RUN mix deps.compile
COPY . .


RUN mix compile

CMD ./bin/run.sh
