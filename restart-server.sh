#!/bin/bash
session=$(tmux list-sessions | cut -d: -f1)
for x in {15..2..-1}
do
  tmux send-keys -t $session 'servermsg "Server restarting in '"$x"' minutes."' ENTER
  sleep 60
done

for x in {60..20..-10}
do
  tmux send-keys -t $session 'servermsg "Server restarting in '"$x"' seconds."' ENTER
  sleep 10
done

for x in {10..2..-1}
do
  tmux send-keys -t $session 'servermsg "Server restarting in '"$x"' seconds."' ENTER
  sleep 1
done

tmux send-keys -t $session 'servermsg "Server restarting in 1 second."' ENTER
sleep 1
tmux send-keys -t $session 'servermsg "Server restarting now."' ENTER
sleep 5
tmux send-keys -t $session "quit" ENTER
sleep 30
tmux send-keys -t $session "clear-history" ENTER
tmux send-keys -t $session "bash start-server.sh" ENTER