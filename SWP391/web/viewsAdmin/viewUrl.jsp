<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
        <script>
            function submitForm(id) {
                document.getElementById("statusChangeForm-" + id).submit();
            }
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
                                            <h1 class="font-medium text-3xl block dark:text-slate-100">Feedback List</h1>
                                            <ol class="list-reset flex text-sm">
                                                <li><a href="#" class="text-gray-500 dark:text-slate-400">Robotech</a></li>
                                                <li><span class="text-gray-500 dark:text-slate-400 mx-2">/</span></li>
                                                <li class="text-gray-500 dark:text-slate-400">Marketing</li>
                                                <li><span class="text-gray-500 dark:text-slate-400 mx-2">/</span></li>
                                                <li class="text-primary-500 hover:text-primary-600 dark:text-primary-400">Feedback</li>
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
                                    <a href="url?action=new" class="bg-blue-500 text-white py-2 px-4 rounded mb-4 inline-block">New URL</a>

                                    <form action="url" method="get" class="mb-4 grid grid-cols-1 gap-4 md:grid-cols-12">
                                        <!-- Comment Keyword Filter -->
                                        <div class="md:col-span-3">
                                            <label for="searchQuery" class="block text-sm font-medium text-gray-700">Search</label>
                                            <input type="text" name="search" id="searchQuery" value="${searchQuery}" class="mt-1 block w-full py-2 px-3 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        </div>

                                        <!-- Submit Button -->
                                        <div class="md:col-span-1 flex justify-end items-end">
                                            <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-dark bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                Apply Filters
                                            </button>
                                        </div>
                                    </form>
                                    <div id="myTabContent">
                                        <div class="active  p-4 bg-gray-50 rounded-lg dark:bg-gray-800/40" id="all" role="tabpanel" aria-labelledby="all-tab">
                                            <div class="grid grid-cols-1 p-0 md:p-4">
                                                <div class="sm:-mx-6 lg:-mx-8">
                                                    <div class="relative overflow-x-auto block w-full sm:px-6 lg:px-8">
                                                        <table id="userTable" class="w-full">
                                                            <thead class="bg-gray-50 dark:bg-gray-700/20">
                                                                <tr>
                                                                    <th scope="col" data-sort="Number" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">
                                                                        Id
                                                                    </th>
                                                                    <th scope="col" data-sort="text" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">
                                                                        URL
                                                                    </th>
                                                                    <th scope="col" data-sort="text" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">
                                                                        Is Access
                                                                    </th>
                                                                    <th scope="col" class="p-3 text-xs font-medium tracking-wider text-left text-gray-700 dark:text-gray-400 uppercase">
                                                                        Action
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="url" items="${listUrl}">
                                                                    <!-- 1 -->
                                                                    <tr class="bg-white border-b border-dashed dark:bg-gray-900 dark:border-gray-700/40">
                                                                        <td class="p-3 font-semibold text-lg text-gray-800 whitespace-nowrap dark:text-gray-400">
                                                                            <input type="text" class="sortValue" value="${url.url}" hidden=""/>
                                                                            ${url.id}
                                                                        </td>
                                                                        <td class="p-3 font-semibold text-lg text-gray-800 whitespace-nowrap dark:text-gray-400">
                                                                            <input type="text" class="sortValue" value="${url.url}" hidden=""/>
                                                                            ${url.url}
                                                                        </td>
                                                                        <td class="p-3 font-semibold text-lg text-gray-800 whitespace-nowrap dark:text-gray-400">
                                                                            <input type="text" class="sortValue" value="${url.access ? "Require" : "Allow"}" hidden=""/>
                                                                            ${url.access ? "Require" : "Allow"}
                                                                        </td>

                                                                        <td class="p-3 text-sm text-gray-500 whitespace-nowrap dark:text-gray-400">
                                                                            <a href="url?action=edit&id=${url.id}"><i class="icofont-ui-edit text-lg text-gray-500 dark:text-gray-400"></i></a>
                                                                            <a href="url?action=delete&id=${url.id}"><i class="icofont-ui-delete text-lg text-red-500 dark:text-red-400"></i></a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                                                                                                  
                                                    </div><!--end div
                                                </div><!--end div-->
                                                </div><!--end grid-->
                                                <div class="flex justify-between mt-4">
                                                    <jsp:include page="components/pagination_common.jsp"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!--end card-body--> 
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

    </body>
</html>