describe http("http://localhost:80") do
  its('status') { should cmp 200 }
  its('body') { should match /One Page Wonder/ }
end
