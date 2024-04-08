1. **Terrafrom deployed scalable static webpage can be accessed with link**: http://cmcst-static-page.s3-website-us-east-1.amazonaws.com
2. **Validating CC Numbers from STDIN**
   - Solution to https://www.hackerrank.com/challenges/validating-credit-card-number/problem

**Future improvements** 
- Configure AWD Cloudfront in front of AWS S3 served static content. Cloudfron will allow disabling s3 public access and making configuration even more secure and reliable by spreading traffic across multiple physical datacenters. 

AWS Credentials should be configured in order to deploy terraform configuration, S3 bucket name is global and will conflict with existing one, please alter it.