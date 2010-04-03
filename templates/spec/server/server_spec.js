describe('server spec', function() {
  describe('yet more tests', function() {
    it('should have a version', function() {
      expect(server.version).toMatch(/^\d+\.\d+\.\d+$/)
    });

    it('should respond to gets on 8000', function() {
      server.server.listen(8000);
      setTimeout(function() {
        var connection = http.createClient(8000, "127.0.0.1");
        var request = connection.request("GET","/", {"host" : "127.0.0.1"});
        var response_body = "";
        request.addListener("response", function (response) {
          expect(response.statusCode).toEqual(200);
          response.addListener("data", function(chunk) {
            response_body += chunk;
          });
          response.addListener("end", function() {
            expect(response_body).toEqual("hi!");
            response_body = "";
            jasmine.async_spec_done();
          });
        });
        request.close();
      }, 20);
      jasmine.async_spec_wait();
    });

    it('should respond to puts on 8000', function() {
      runs(function() {
        var connection = http.createClient(8000, "127.0.0.1");
        var request = connection.request("POST","/", {"host" : "127.0.0.1"});
        request.write("howdy!", encoding="ascii");
        request.close();
        }, 20);
        
      waits(400);
      
      runs(function() { 
        expect(server.results).toEqual("POST / /: howdy!")
        server.server.close();
      });
    });
  });
});
