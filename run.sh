#!/bin/bash

mix deps.get
mix ecto.create
mix phx.server