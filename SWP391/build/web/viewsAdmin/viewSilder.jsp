<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth group" data-sidebar="brand" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <title>Robotech - Admin & Dashboard Template</title>
        <meta  name="viewport"  content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta  content="Tailwind Multipurpose Admin & Dashboard Template"  name="description"/>
        <meta content="" name="Mannatthemes" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="viewsAdmin/assets/images/favicon.ico" />

        <!-- Css -->
        <!-- Main Css -->
        <link rel="stylesheet" href="viewsAdmin/assets/libs/icofont/icofont.min.css">
        <link href="viewsAdmin/assets/libs/flatpickr/flatpickr.min.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="viewsAdmin/assets/css/tailwind.min.css">


        <!-- Favicons-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

        <!-- GOOGLE WEB FONT -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

        <!-- BASE CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <!-- SPECIFIC CSS -->
        <link href="css/home_1.css" rel="stylesheet">

        <!-- YOUR CUSTOM CSS -->
        <link href="css/custom.css" rel="stylesheet">

        <script type="text/javascript">

        </script>

    </head>

    <body data-layout-mode="light"  data-sidebar-size="default" data-theme-layout="vertical" class="bg-[#EEF0FC] dark:bg-gray-900">

        <jsp:include page="components/leftBar.jsp" />

        <jsp:include page="components/topBar.jsp" />

        <jsp:include page="components/notification.jsp" />


        <div class="ltr:flex flex-1 rtl:flex-row-reverse">
            <div class="page-wrapper relative ltr:ms-auto rtl:me-auto rtl:ms-0 w-[calc(100%-260px)] px-4 pt-[64px] duration-300">
                <div class="xl:w-full">        
                    <div class="flex flex-wrap">
                        <div class="flex items-center py-4 w-full">
                            <div class="w-full">                    
                                <div class="">
                                    <div class="flex flex-wrap justify-between">
                                        <div class="items-center ">
                                            <h1 class="font-medium text-3xl block dark:text-slate-100">Products</h1>
                                            <ol class="list-reset flex text-sm">
                                                <li><a href="#" class="text-gray-500 dark:text-slate-400">Robotech</a></li>
                                                <li><span class="text-gray-500 dark:text-slate-400 mx-2">/</span></li>
                                                <li class="text-gray-500 dark:text-slate-400">Admin</li>
                                                <li><span class="text-gray-500 dark:text-slate-400 mx-2">/</span></li>
                                                <li class="text-primary-500 hover:text-primary-600 dark:text-primary-400">Products</li>
                                            </ol>
                                        </div>
                                        <div class="flex items-center">
                                            <div class="today-date leading-5 mt-2 lg:mt-0 form-input w-auto rounded-md border inline-block border-primary-500/60 dark:border-primary-500/60 text-primary-500 bg-transparent px-3 py-1 focus:outline-none focus:ring-0 placeholder:text-slate-400/70 placeholder:font-normal placeholder:text-sm hover:border-primary-400 focus:border-primary-500 dark:focus:border-primary-500  dark:hover:border-slate-700">
                                                <input type="text" class="dash_date border-0 focus:border-0 focus:outline-none" readonly  required="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--end container-->

                <div class="xl:w-full  min-h-[calc(100vh-138px)] relative pb-14"> 
                    <div class="grid grid-cols-12 sm:grid-cols-12 md:grid-cols-12 lg:grid-cols-12 xl:grid-cols-12 gap-4">
                        <div class="col-span-12 sm:col-span-12 md:col-span-12 lg:col-span-12 xl:col-span-12">
                            <div class="w-full relative mb-4">  
                                <div class="flex-auto p-0 md:p-4">
                                    <div class="mb-4 border-b border-gray-200 dark:border-slate-700" data-fc-type="tab">
                                        <ul class="flex flex-wrap -mb-px text-sm font-medium text-center" aria-label="Tabs">

                                        </ul>
                                    </div>
<!--                                    <div>
                                        <button data-toggle="modal" data-target="#addProductModal" data-backdrop="false" class="inline-block focus:outline-none bg-brand-500 mt-1 text-white hover:bg-brand-600 hover:text-white  text-md font-medium py-2 px-4 rounded">
                                            Add Silder
                                        </button>
                                    </div>-->
                                    <span>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </span>

                                    <div id="myTabContent">
                                        <form action="sliderList" method="get" class="mb-4 grid grid-cols-1 gap-4 md:grid-cols-12">
                                            <!-- Status Filter -->
                                            <div class="md:col-span-2">
                                                <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
                                                <select name="status" id="status" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                    <option value="">Select Status</option>
                                                    <option value="">text</option>
                                                    <option value="pending" <c:if test="${status == 'pending'}">selected</c:if>>Pending</option>
                                                    <option value="approved"<c:if test="${status == 'approved'}">selected</c:if>>Approved</option>
                                                        <!-- Add more status options as needed -->
                                                    </select>
                                                </div>
                                                <!-- Comment Keyword Filter -->
                                                <div class="md:col-span-2">
                                                    <label for="search" class="block text-sm font-medium text-gray-700">Search</label>
                                                    <input type="text" name="search" id="search" value="${search}" class="mt-1 block w-full py-2 px-3 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                            </div>
                                            <!-- Submit Button -->
                                            <div class="md:col-span-1 flex justify-end items-end">
                                                <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-dark bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                    Apply Filters
                                                </button>
                                            </div>
                                        </form>
                                        <div class="active  p-4 bg-gray-50 rounded-lg dark:bg-gray-900" id="all" role="tabpanel" aria-labelledby="all-tab">
                                            <div class="grid grid-cols-1 p-0 md:p-4">
                                                <div class="sm:-mx-6 lg:-mx-8">
                                                    <div class="relative overflow-x-auto block w-full sm:px-6 lg:px-8">
                                                        <table id="userTable" class="w-full">
                                                            <thead class="bg-gray-50 dark:bg-slate-700/20">
                                                                <tr>
                                                                    <th scope="col" data-sort="number" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">ID</th>
                                                                    <th scope="col" data-sort="text" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">Created By</th>
                                                                    <th scope="col" data-sort="text" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">Title</th>
                                                                    <th scope="col" data-sort="text" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">Image</th>
                                                                    <th scope="col" data-sort="text" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">BackLink</th>
                                                                    <th scope="col" data-sort="text" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">Status</th>
                                                                    <th scope="col" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="p" items="${sliders}" varStatus="status">
                                                                    <tr class="bg-white border-b border-dashed dark:bg-gray-900 dark:border-gray-700/40">
                                                                        <td class="p-3 text-sm font-medium whitespace-nowrap dark:text-white">${status.index + 1}</td>
                                                                        <td class="p-3 text-sm font-medium whitespace-nowrap dark:text-white">
                                                                            <img src="#" alt="" class="me-2 h-8 inline-block">${p.user.getFullname()}
                                                                        </td>
                                                                        <td class="p-3 text-sm font-medium whitespace-nowrap dark:text-white">${p.title}</td>
                                                                        <td class="p-3 text-sm font-medium whitespace-nowrap dark:text-white">
                                                                            <img src="${p.image}" style="width: 120px; height: 30%; "/>
                                                                        </td>
                                                                        <td class="p-3 text-sm font-medium whitespace-nowrap dark:text-white">${p.backLink}</td>
                                                                        <td class="p-3 text-sm font-medium whitespace-nowrap dark:text-white">
                                                                            <form method="POST" action="sliderList">
                                                                                <select name="status" onchange="this.form.submit()">
                                                                                    <option value="Inactive" ${p.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                                                                    <option value="Active" ${p.status == 'Active' ? 'selected' : ''}>Active</option>
                                                                                </select>
                                                                                <input type="hidden" name="id" value="${p.id}">
                                                                            </form>

                                                                        </td>
                                                                        <td class="p-3 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">
                                                                            <a href="sliderDetail?id=${p.id}" class="text-blue-500 hover:text-blue-800">View</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div><!--end div-->
                                                </div><!--end div-->
                                            </div><!--end grid-->
                                            <div class="flex justify-between mt-4">
                                                <jsp:include page="components/pagination_slider.jsp" />
                                            </div>
                                        </div>

                                    </div>
                                </div><!--end card-->                                  
                            </div><!--end col-->                        
                        </div> <!--end grid-->                                        
                        <!-- footer -->
                        <div class="absolute bottom-0 -left-4 -right-4 block print:hidden border-t p-4 h-[52px] dark:border-slate-700/40">
                            <div class="container">
                                <!-- Footer Start -->
                                <footer
                                    class="footer bg-transparent  text-center  font-medium text-slate-600 dark:text-slate-400 md:text-left "
                                    >
                                    &copy;
                                    <script>
                                        var year = new Date();
                                        document.write(year.getFullYear());
                                    </script>
                                    Robotech
                                    <span class="float-right hidden text-slate-600 dark:text-slate-400 md:inline-block"
                                          >Crafted with <i class="ti ti-heart text-red-500"></i> by
                                        Mannatthemes</span
                                    >
                                </footer>
                                <!-- end Footer -->
                            </div>
                        </div>
                    </div><!--end container-->
                </div><!--end page-wrapper-->
            </div><!--end /div-->

            <!--Add product-->
            <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <!--Modal Header--> 
                        <div class="modal-header" style="background-color: #007bff">
                            <h5 class="modal-title" id="editProductModalLabel">Add Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeAddModal()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <!--Modal Body--> 
                        <form action="productList" method="post">
                            <div class="modal-body">
                                <div class="form-group input-group">
                                    <input style="border: 1px solid #ced4da; height: 38px; border-radius: 5px" class="input-group" type="hidden" id="img1" name="img1" value="">
                                </div>
                                <div class="form-group">
                                    <input style="border: 1px solid #ced4da; height: 38px; border-radius: 5px" class="input-group" type="hidden" id="img2" name="img2" value="">
                                </div>
                                <div class="form-group input-group">
                                    <label for="title">Title:</label>
                                    <input style="border: 1px solid #ced4da; height: 38px; border-radius: 5px" class="input-group" type="text" id="title" name="title" required>
                                </div>
                                <div class="form-group input-group">
                                    <label for="description">Description:</label>
                                    <input style="border: 1px solid #ced4da; height: 38px; border-radius: 5px" class="input-group" type="text" id="description" name="description" required>
                                </div>
                                <div class="form-group input-group">
                                    <label for="price">Price:</label>
                                    <input style="border: 1px solid #ced4da; height: 38px; border-radius: 5px" class="input-group" type="number" step="0.01" id="price" name="price" required>
                                </div>
                                <div class="form-group">
                                    <label for="discount">Discount:</label>
                                    <select class="form-select" id="discount" name="discount" required>
                                        <c:forEach var="d" items="${listDiscount}">
                                            <option value="${d.id}">${d.discountPercent}%</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="brand">Brand:</label>
                                    <select class="form-select" id="brand" name="brand" required>
                                        <c:forEach var="b" items="${listBrand}">
                                            <option value="${b.id}">${b.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status:</label>
                                    <select class="form-select" id="status" name="status" required>
                                        <c:forEach var="s" items="${listProductStatus}">
                                            <option value="${s.id}">${s.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div>
                                    <label>Color:</label><br>
                                    <c:forEach var="c" items="${listColor}">
                                        <input <c:if test="${c == 'White'}">checked</c:if> type="checkbox" id="color" name="color" value="${c}">
                                        <label for="color">${c}</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                </div>
                            </div>
                            <!--Modal Footer--> 
                            <div class="modal-footer" style="background-color: #007bff">
                                <button type="submit" class="btn btn-primary" >Save Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeAddModal()"">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- JAVASCRIPTS -->
            <!-- <div class="menu-overlay"></div> -->
            <script src="viewsAdmin/assets/libs/lucide/umd/lucide.min.js"></script>
            <script src="viewsAdmin/assets/libs/simplebar/simplebar.min.js"></script>
            <script src="viewsAdmin/assets/libs/flatpickr/flatpickr.min.js"></script>
            <script src="viewsAdmin/assets/libs/@frostui/tailwindcss/frostui.js"></script>

            <script src="viewsAdmin/assets/libs/apexcharts/apexcharts.min.js"></script>
            <script src="viewsAdmin/assets/js/pages/analytics-index.init.js"></script>
            <script src="viewsAdmin/assets/js/app.js"></script>
            <!-- JAVASCRIPTS -->
            <script src="${pageContext.request.contextPath}/viewsAdmin/assets/js/dataTable.js"></script>
            <script src="${pageContext.request.contextPath}/viewsAdmin/assets/js/product.js"></script>

            <!-- COMMON SCRIPTS -->
            <script src="js/common_scripts.min.js"></script>
            <script src="js/main.js"></script>

            <!-- SPECIFIC SCRIPTS -->
            <script src="js/carousel-home.js"></script>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>