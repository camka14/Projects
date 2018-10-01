function fibnum = fib(n)
    % n is an input
    % fibnum is an output, representing the Fibonacci number
    % Names of vairalbes (fibnum,n) can be changed.  The name of function (fib) and the order of the variables cannot.
    f=0
    b=1
    for s=1:1:n 
        f=f+b
        b=f-b
        s=s+1
    end
    fibnum=f