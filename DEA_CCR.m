function[theta, lamdas, s_inputs, s_outputs, projections] = DEA_CCR(data, inputs, outputs)

%LIST 10

%Standard DEA CCR input-oriented model
% 27x lambda
%variables -> [theta, lambda1, lambda2,..., lambda27]

%Treat cost and repeatability as inputs, whereas load capacity and velocity as outputs

%% Initialize data
[n,m] = size(data);
X = data(:,1:inputs); %inputs
Y = data(:,inputs+1:m); %outputs
theta = nan(1,n);
lamdas = nan(1,n);
s_inputs = nan(inputs,n);
s_outputs = nan(outputs,n);
projections = nan(n,m);

%% Phase I
% Variables -> [theta, lamdas]

for i=1:n
    model.obj = [1 zeros(1,n)];
    model.modelsense = 'min';

    a1 = [-X(i,:)' X']; %input
    a2 = [zeros(outputs,1) Y']; %output
    model.A = sparse([a1;a2]);

    model.rhs = [zeros(inputs,1); Y(i,:)'];
    model.sense = [repmat('<',1,inputs) repmat('>',1,outputs)];
    
    params.outputflag = 0;
    result_a = gurobi(model, params);
    theta(1, i) = result_a.x(1);
end
%% Phase II
% Variables -> [lamdas,s_inputs,s_outputs]
% for every input we have a slack

for i=1:n
    model_lab11b.obj=[zeros(1,n) ones(1,m)];
    model_lab11b.modelsense = 'max';

    a1=[X' eye(inputs) zeros(inputs,outputs)]; %lambda*x + slacks; eye - creating a square matrix where in diagonal all elements are 1, and the rest are 0
    a2=[Y' zeros(outputs,inputs) -eye(outputs)];
    model_lab11b.A = sparse([a1;a2]);

    model_lab11b.rhs=[theta(1,i).*X(i,:) Y(i,:)]';
    model_lab11b.sense = repmat('=',1,m);

    params.outputflag = 0;
    result_b = gurobi(model_lab11b, params);

%optimal values
    lamdas(:,i)=result_b.x(1:n,1);
    s_inputs(:,i)=result_b.x(n+1:n+inputs,1);
    s_outputs(:,i)=result_b.x(n+inputs+1:n+m,1);
end

%% Projections - 2nd question

for i=1:n
    projections(i,:)=lamdas(:,i)'*data;
end

%RESULTS
    
%columns - units
%slacks = 0, theta = 1 === strong efficient
%lamda when it's 1 that means that sees itself as the best value so it's
%efficient

%projection-data = targets in question 2
