BENCHMARK="import timeit; print(timeit.timeit('import json; json.dumps(list(range(10000)))', number=5000))"
echo "Runtimes with large allocations"
echo "Time for python:2-alpine3.6"
docker run python:2-alpine3.6 python -c "$BENCHMARK"

echo "Time for python:2-slim"
docker run python:2-slim python -c "$BENCHMARK"

echo "Time for python:3-alpine3.6"
docker run python:3-alpine3.6 python -c "$BENCHMARK"

echo "Time for python:3-slim"
docker run python:3-slim python -c "$BENCHMARK"