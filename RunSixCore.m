gcp;

parfor i = 1 : 6
    SolverMatrixInv(100);
end

function SolverMatrixInv(n)
    for i= 1:n
        inv(rand(500)*10);
    end
end