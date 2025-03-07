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
            function submitForm(feedbackId) {
                document.getElementById("statusChangeForm_" + feedbackId).submit();
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
                                            <ol class="list-reset flex text-sm">
                                                <li><a href="#" class="text-gray-500 dark:text-slate-400">Robotech</a></li>
                                                <li><span class="text-gray-500 dark:text-slate-400 mx-2">/</span></li>
                                                <li class="text-gray-500 dark:text-slate-400">Admin</li>
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
                <div class="container mx-auto">
                    <h2 class="text-xl mb-4">${url != null ? 'Edit URL' : 'New URL'}</h2>
                    <form action="url?action=${url != null ? 'update' : 'insert'}" method="post" class="space-y-4">
                        <input type="hidden" name="id" value="${url != null ? url.id : ''}" />
                        <div class="form-group">
                            <label for="url" class="block">URL</label>
                            <input type="text" class="border p-2 w-full" id="url" name="url" value="${url != null ? url.url : ''}" required />
                        </div>
                        <div class="form-group">
                            <label for="access" class="block">Access</label>
                            <select class="border p-2 w-full" id="access" name="access">
                                <option value="true" ${url != null && url.access ? 'selected' : ''}>True</option>
                                <option value="false" ${url != null && !url.access ? 'selected' : ''}>False</option>
                            </select>
                        </div>
                        <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">${url != null ? 'Update' : 'Save'}</button>
                    </form>
                </div>

                <div class="xl:w-full  min-h-[calc(100vh-138px)] relative pb-14"> 
                    <div class="grid grid-cols-12 sm:grid-cols-12 md:grid-cols-12 lg:grid-cols-12 xl:grid-cols-12 gap-4">
                        <div class="col-span-12 sm:col-span-12 md:col-span-12 lg:col-span-12 xl:col-span-12">
                            <div class="w-full relative mb-4">  
                                <div class="flex-auto p-0 md:p-4">
                                    <div class="flex flex-wrap gap-4 mb-3">
                                    </div>
                                    <div class="container mx-auto p-4">

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