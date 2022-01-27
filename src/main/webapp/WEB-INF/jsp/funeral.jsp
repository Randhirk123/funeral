<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />

    <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Golden Funerals</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<base
	href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
<!-- Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="css/style1.css" rel="stylesheet">
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center">
	<div class="container d-flex justify-content-between align-items-center">
		<div class="logo">
			<h1><a href="/funeral"> Golden Funerals</a></h1>
			
			<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>--> 
		</div>
		<nav id="navbar" class="navbar"> <a href="#" class="btn btn-primary">GET A FREE QUOTE</a> </nav>
		<!-- .navbar --> 
		
	</div>
</header>
<!-- End Header --> 

<!-- ======= Hero Section ======= -->
<section class="hero-section py-5" id="hero">
	<div class="wave"> <svg width="100%" height="355px" viewBox="0 0 1920 355" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
		<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
			<g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
				<path d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,757 L1017.15166,757 L0,757 L0,439.134243 Z" id="Path"></path>
			</g>
		</g>
		</svg> </div>
	<div class="container pt-lg-5">
		<div class="row">
			<div class="col-12 hero-text-image pt-lg-5">
				<div class="row">
					<div class="col-lg-8 text-center text-white text-lg-start">
						<h1 class="fs-1" data-aos="fade-right">Get Free Funeral Quote Within 30 Seconds</h1>
						<h3 class="fs-3 text-white mb-4" data-aos="fade-right" data-aos-delay="100">Lock-in Funeral Director Costs </h3>
						<ul class="list-unstyled fs-5 mb-4" data-aos="fade-right" data-aos-delay="200" data-aos-offset="-500">
							<li><i class="bi bi-check-circle-fill me-1"></i> Fair and Affordable Plan Options</li>
							<li><i class="bi bi-check-circle-fill me-1"></i> Quick Response</li>
							<li><i class="bi bi-check-circle-fill me-1"></i> Free, No- Obligation Quote</li>
						</ul>
						<div class="row">
							<div class="col-lg-10">
								<div class="card bg-black bg-opacity-25 border-0 rounded-3 mb-5 mb-lg-0" data-aos="fade-right" data-aos-delay="300" data-aos-offset="-500">
									<div class="card-body px-4 py-4">
										<p class="text-warning fs-3"><i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i></p>
										<p class="fst-italic">" Very Polite And Professional Team And They Have Affordable Plan Options."</p>
										<p class="mb-0 fw-bold">Paul Brown, Sheffield</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 iphone-wrap">
						<div class="card card-sticky text-dark shadow-lg">
							<div class="card-body px-4 py-4">
								<h4 class="card-title text-primary fw-bold text-center mb-4">Start Your Quote Now!</h4>
								<form:form action="/funeral" modelAttribute="funeral" method="post" name="registration">
									<fieldset>
										<div class="row gx-1">
											<div class="col-sm-12">
												<div class="mb-3">
													<label for="funeralType" class="form-label mb-0">Type of Funeral</label>
													<p class="my-0">
														<input type="radio" class="btn-check" name="funeralType" id="burial" value="1" required="required">
														<label class="btn btn-outline-secondary btn-sm" for="burial">Burial</label>
														<input type="radio" class="btn-check" name="funeralType" id="cremation" value="2" required="required">
														<label class="btn btn-outline-secondary btn-sm" for="cremation">Cremation</label>
													</p>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="mb-3">
													<label for="title" class="form-label mb-0">Title</label>
													<select class="form-select form-select-sm" name="title" id="title" required="required">
													<option value="">Select</option>
													<option value="mr">Mr</option>
													<option value="mrs">Mrs</option>
													<option value="miss">Miss</option>
													<option value="ms">Ms</option>
													<option value="dr">Dr</option>
													</select>
												</div>
											</div>
											<div class="col-sm-8">
												<div class="mb-3">
													<label for="first_name" class="form-label mb-0">First Name</label>
													<input type="text" class="form-control form-control-sm" id="first_name" name="first_name" placeholder="John">
												</div>
											</div>
											<div class="col-sm-12">
												<div class="mb-3">
													<label for="last_name" class="form-label mb-0">Last Name</label>
													<input type="text" class="form-control form-control-sm" id="last_name" name="last_name" placeholder="Smith">
												</div>
											</div>
											<div class="col-sm-12">
												<div class="mb-3">
													<label for="lname" class="form-label mb-0">Date of Birth</label>
													<div class="row gx-1">
														<div class="col-3">
															<label for="day" class="form-label d-none">Date</label>
															<select class="form-select form-select-sm" id="day" name="day">
															<option selected>DD</option>
															<option value="01">1</option>
															<option value="02">2</option>
															<option value="03">3</option>
															<option value="04">4</option>
															<option value="05">5</option>
															<option value="06">6</option>
															<option value="07">7</option>
															<option value="08">8</option>
															<option value="09">9</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
															<option value="18">18</option>
															<option value="19">19</option>
															<option value="20">20</option>
															<option value="21">21</option>
															<option value="22">22</option>
															<option value="23">23</option>
															<option value="24">24</option>
															<option value="25">25</option>
															<option value="26">26</option>
															<option value="27">27</option>
															<option value="28">28</option>
															<option value="29">29</option>
															<option value="30">30</option>
															<option value="31">31</option>
															</select>
														</div>
														<div class="col-6">
															<label for="month" class="form-label d-none">Month</label>
															<select class="form-select form-select-sm" id="month" name="month" required="required">
															<option value="">Month</option>
															<option value="january">January</option>
															<option value="february">February</option>
															<option value="march">March</option>
															<option value="april">April</option>
															<option value="may">May</option>
															<option value="june">June</option>
															<option value="july">July</option>
															<option value="august">August</option>
															<option value="september">September</option>
															<option value="october">October</option>
															<option value="november">November</option>
															<option value="december">December</option>
															</select>
														</div>
														<div class="col-3">
															<label for="year" class="form-label d-none">Year</label>
															<select class="form-select form-select-sm" id="year" name="year">
															<option selected>YYYY</option>
															<option value="2021">2021</option>
															<option value="2020">2020</option>
															<option value="2019">2019</option>
															<option value="2018">2018</option>
															<option value="2017">2017</option>
															<option value="2016">2016</option>
															<option value="2015">2015</option>
															<option value="2014">2014</option>
															<option value="2013">2013</option>
															<option value="2012">2012</option>
															<option value="2011">2011</option>
															<option value="2010">2010</option>
															<option value="2009">2009</option>
															<option value="2008">2008</option>
															<option value="2007">2007</option>
															<option value="2006">2006</option>
															<option value="2005">2005</option>
															<option value="2004">2004</option>
															<option value="2003">2003</option>
															<option value="2002">2002</option>
															<option value="2001">2001</option>
															<option value="2000">2000</option>
															<option value="1999">1999</option>
															<option value="1998">1998</option>
															<option value="1997">1997</option>
															<option value="1996">1996</option>
															<option value="1995">1995</option>
															<option value="1994">1994</option>
															<option value="1993">1993</option>
															<option value="1992">1992</option>
															<option value="1991">1991</option>
															<option value="1990">1990</option>
															<option value="1989">1989</option>
															<option value="1988">1988</option>
															<option value="1987">1987</option>
															<option value="1986">1986</option>
															<option value="1985">1985</option>
															<option value="1984">1984</option>
															<option value="1983">1983</option>
															<option value="1982">1982</option>
															<option value="1981">1981</option>
															<option value="1980">1980</option>
															<option value="1979">1979</option>
															<option value="1978">1978</option>
															<option value="1977">1977</option>
															<option value="1976">1976</option>
															<option value="1975">1975</option>
															<option value="1974">1974</option>
															<option value="1973">1973</option>
															<option value="1972">1972</option>
															<option value="1971">1971</option>
															<option value="1970">1970</option>
															<option value="1969">1969</option>
															<option value="1968">1968</option>
															<option value="1967">1967</option>
															<option value="1966">1966</option>
															<option value="1965">1965</option>
															<option value="1964">1964</option>
															<option value="1963">1963</option>
															<option value="1962">1962</option>
															<option value="1961">1961</option>
															<option value="1960">1960</option>
															<option value="1959">1959</option>
															<option value="1958">1958</option>
															<option value="1957">1957</option>
															<option value="1956">1956</option>
															<option value="1955">1955</option>
															<option value="1954">1954</option>
															<option value="1953">1953</option>
															<option value="1952">1952</option>
															<option value="1951">1951</option>
															<option value="1950">1950</option>
															<option value="1949">1949</option>
															<option value="1948">1948</option>
															<option value="1947">1947</option>
															<option value="1946">1946</option>
															<option value="1945">1945</option>
															<option value="1944">1944</option>
															<option value="1943">1943</option>
															<option value="1942">1942</option>
															<option value="1941">1941</option>
															<option value="1940">1940</option>
															<option value="1939">1939</option>
															<option value="1938">1938</option>
															<option value="1937">1937</option>
															<option value="1936">1936</option>
															<option value="1935">1935</option>
															<option value="1934">1934</option>
															<option value="1933">1933</option>
															<option value="1932">1932</option>
															<option value="1931">1931</option>
															<option value="1930">1930</option>
															<option value="1929">1929</option>
															<option value="1928">1928</option>
															<option value="1927">1927</option>
															<option value="1926">1926</option>
															<option value="1925">1925</option>
															<option value="1924">1924</option>
															<option value="1923">1923</option>
															<option value="1922">1922</option>
															<option value="1921">1921</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="col-sm-12">
												<div class="mb-3">
													<label for="email" class="form-label mb-0">Email Address</label>
													<input type="email" class="form-control form-control-sm" id="email" name="email" placeholder="email@example.com">
												</div>
											</div>
											<div class="col-sm-12">
												<div class="mb-3">
													<label for="mobile" class="form-label mb-0">Mobile Number</label>
													<input type="tel" class="form-control form-control-sm" id="mobile" name="mobile" placeholder="0000-000-000">
												</div>
											</div>
											<div class="col-sm-12">
												<div class="mb-2">
													<label for="postcode" class="form-label mb-0">Postcode</label>
													<div class="row gx-1">
														<div class="col-sm-6">
															<div class="mb-1">
																<label for="postCode" class="form-label mb-0 d-none">Mobile Number</label>
																<input type="tel" class="form-control form-control-sm" id="postCode" name="postCode" placeholder="Enter a postcode">
															</div>
														</div>
														<div class="col-sm-6">
															<div class="mb-1">
																<button type="button" class="btn btn-primary btn-sm opacity-75 w-100" id="call" class="call">Lookup Address</button>
															</div>
														</div>
														<div class="col-sm-12">
															<div class="mb-1">
																<label for="address" class="form-label d-none">Select a address</label>
																<select class="form-select form-select-sm" id="address" name="address">
																<option value="" id="setAddr" >- Select Address -</option>
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-sm-12">
												<div class="mb-3">
													<button type="submit">Save</button>
												</div>
											</div>
										</div>
									</fieldset>
								</form:form>
								<p class="card-text text-muted mb-0 fs-6"><small>By submitting your details you are consenting to having your details passed to an FCA authorized funeral Cover firm who will use the details provided to contact you via phone/email/SMS/Post. Should you wish to withdraw your consent, you may inform the adviser of this at any time. For further information regarding these partners please see our Privacy Policy. <a href="privacy.html" class="text-primary">Privacy Policy</a>.</small></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Hero -->

<main id="main">
	<section class="section">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="row align-items-center">
						<div class="col-md-12">
							<h2 class="mb-4">How does it work?</h2>
							<h4 class="mb-4 text-primary">Funeral costs have risen 116% since 2004!</h4>
							<p class="mb-4">Golden  Funerals works with various funeral plan provider and will help you find a local funeral plan provider. a Pre-Arranged Funeral Plan will freeze the cost of your funeral at today’s prices saving you thousands of pounds.
								Funeral plans in 5/7 years will be double the costs of today. The chances are very high that you will be alive much longer than that the prices will never come down but continue to rise imagine you live 20 years more if in 5 years they will be near to £10,000 </p>
							<div class="row align-items-center text-center">
								<div class="col-md-4">
									<p class="fs-4 fw-bold">Golden Funerals Group</p>
								</div>
								<div class="col-md-4">
									<p><a href="#" class="btn btn-primary w-100 text-capitalize">Get your free quote</a></p>
								</div>
								<div class="col-md-4">
									<p class="fs-4 fw-bold">Golden Funerals</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<p class="mb-4">Goldenfunerals.co.uk website will introduce you to verified and regulated funeral Cover providers, who’ll manage your quote.</p>
							<p><a href="#" class="btn btn-primary w-100 text-capitalize">Get your free quote</a></p>
						</div>
						<div class="col-md-6">
							<p class="mb-4">Golden  Funerals are not a funeral Cover company and do not provide the Cover. We put you in touch with the Cover experts who help you get the funeral quote you deserve. Any funeral Cover or funeral information on this website or directly linked from this website is not to be considered funeral Cover advice.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- ======= Testimonials Section ======= -->
	<section class="section border-top border-bottom">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="row justify-content-center text-center mb-5">
						<div class="col-md-12">
							<h2 class="section-heading">Review From Our Customers</h2>
						</div>
					</div>
					<div class="row justify-content-center text-center">
						<div class="col-md-12">
							<div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="review text-center">
											<p class="stars"> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill muted"></span> </p>
											<h3>Impressive Service!</h3>
											<blockquote>
												<p>Agent was brilliant. He explained everything clearly and Made Sure I understood Everything.</p>
											</blockquote>
											<p class="review-user"> <img src="assets/img/person_1.jpg" alt="Image" class="img-fluid rounded-circle mb-3"> <span class="d-block"> <span class="text-black">Sophie</span> </span> </p>
										</div>
									</div>
									<!-- End testimonial item -->
									
									<div class="swiper-slide">
										<div class="review text-center">
											<p class="stars"> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill muted"></span> </p>
											<h3>This Website is Helpful & easy to use!</h3>
											<blockquote>
												<p>Lovely People, Very Pleasant & Helpful.</p>
											</blockquote>
											<p class="review-user"> <img src="assets/img/person_2.jpg" alt="Image" class="img-fluid rounded-circle mb-3"> <span class="d-block"> <span class="text-black">Johan Smith</span></span> </p>
										</div>
									</div>
									<!-- End testimonial item -->
									
									<div class="swiper-slide">
										<div class="review text-center">
											<p class="stars"> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill"></span> <span class="bi bi-star-fill muted"></span> </p>
											<h3>Awesome Company!</h3>
											<blockquote>
												<p>Agent was very polite & helpful.</p>
											</blockquote>
											<p class="review-user"> <img src="assets/img/person_3.jpg" alt="Image" class="img-fluid rounded-circle mb-3"> <span class="d-block"> <span class="text-black">Mellisa Stack</span></span> </p>
										</div>
									</div>
									<!-- End testimonial item --> 
									
								</div>
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Testimonials Section --> 
	
	<!-- ======= CTA Section ======= -->
	<section class="section cta-section">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="row align-items-center">
						<div class="col-md-7 me-auto text-center text-md-start mb-5 mb-md-0">
							<h3 class="fw-bold text-white">Golden Funerals</h3>
						</div>
						<div class="col-md-5 text-center text-md-start">
							<ul class="list-unstyled fs-5 mb-4">
								<li class="mb-4"><i class="bi bi-check-circle-fill me-1"></i> Fair and Affordable Plan Options</li>
								<li class="mb-4"><i class="bi bi-check-circle-fill me-1"></i> Quick Response</li>
								<li><i class="bi bi-check-circle-fill me-1"></i> Free, No- Obligation Quote</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End CTA Section --> 
	
</main>
<!-- End #main --> 

<!-- ======= Footer ======= -->
<footer class="footer" role="contentinfo">
	<div class="container">
		<div class="row text-center text-lg-start">
			<div class="col-12 col-lg-8">
				<div class="row">
					<div class="col-md-6 mb-4 mb-md-0">
						<p>Golden  Funerals are not a funeral Cover company and do not provide the Cover. We put you in touch with the Cover experts who help you get the funeral quote you deserve.</p>
					</div>
					<div class="col-md-6 mb-4 mb-md-0">
						<p>Civanta Media Limited is a Company registered in England under company number 13667719.Registered address: Kemp House 160, City Road, London, EC1V 2NX Email address: info@civantamedia.co.uk </p>
					</div>
				</div>
				<p class="social"> <a href="#"><span class="bi bi-twitter"></span></a> <a href="#"><span class="bi bi-facebook"></span></a> <a href="#"><span class="bi bi-instagram"></span></a> <a href="#"><span class="bi bi-linkedin"></span></a> </p>
				<div class="row justify-content-center">
					<div class="col-md me-md">
						<p class="copyright">&copy; Copyright Civanta Media Limited. All Rights Reserved</p>
					</div>
					<div class="col-md-auto">
						<p class="copyright"><a href="/privacy">Privacy Policy</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a> 

<!-- Vendor JS Files --> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="assets/vendor/aos/aos.js"></script> 
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script> 
<script src="assets/vendor/php-email-form/validate.js"></script> 
<script src="assets/vendor/sticky/jquery.sticky.js"></script> 
<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

<script type="text/javascript">
    // document.ready function
    $(function() {
        // selector has to be . for a class name and # for an ID
        $('#call').click(function(e) {
            e.preventDefault(); // prevent form from reloading page
            

            $.ajax({
            	type : 'GET',
				url : '${req.getContextPath()}/address/',
				data : {
					"id" : 1,
				},
                success : function(data) {
                		  $("#setAddr").text(data);
                		
                }
            });
        });
    });
</script>
<script type="text/javascript">
</script>
<!-- DS Main JS File --> 
<script src="assets/js/main.js"></script>
</body>
</html>