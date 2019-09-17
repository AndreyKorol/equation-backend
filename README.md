### Description

Web api for [Equation Solver](https://github.com/AndreyKorol/equation-backend/tree/master/lib)

Try this api in [https://solverapp.herokuapp.com/](https://solverapp.herokuapp.com/)

### How to run locally:

```
~$ bundle
~$ rails s --port=3001
```
### Examples

```
curl -X POST https://solverapp.herokuapp.com/api/v1/equations/linear -H "Content-Type: application/json" -d '{"coefficients": [2, 6]}'
```
Return root binded in array: `{"root":[-3.0]}`


```
curl -X POST https://solverapp.herokuapp.com/api/v1/equations/quadratic -H "Content-Type: application/json" -d '{"coefficients": [1, -8, 12]}'
```

Return array of roots: `{"roots":[6.0,2.0]}`
