# MediaWiki
Jump to search     MediaWiki is a collaboration and documentation platform brought to you by a vibrant community.


	

docker-compose up --scale mediawiki=3

The above command will start three instances of mediawiki Server, which can be accessed at http://localhost:4000. The requests to this URL will get load balanced and distributed to one of the 3 mediawiki Docker containers.
