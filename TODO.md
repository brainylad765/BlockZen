# TODO List for BlockZen App Edits

## 1. Profile Screen Buffer Pool Section
- [x] Add "Buffer Pool" menu item in ProfileScreen's menu list
- [x] Navigate to BufferPoolScreen on tap

## 2. Buffer Pool Screen
- [x] Create frontend/front/lib/screens/buffer_pool_screen.dart
- [x] Display current buffer pool amount in rupees (₹0.00)
- [x] Show message "There ain't any projects" for now

## 3. Projects Screen New Project
- [x] Add new project with status "Requested" in ProjectsScreen _projects list
- [x] Add red color mapping for "Requested" status in _getStatusColor method

## 4. Home Tab Project Info Window
- [x] Add button/menu item in HomeScreen to open new window
- [x] Create frontend/front/lib/screens/home_project_info_screen.dart
- [x] Show project info similar to ProjectsScreen with map view

## 5. Data Screen File Upload
- [x] Add image upload functionality to DataScreen (camera capture, location, countdown)
- [x] Integrate with UploadProvider for image management

## 6. Buffer Pool Real-time Updates
- [x] Create BufferPoolProvider for state management
- [x] Add amount input field to BufferPoolScreen
- [x] Connect file uploads to buffer pool amount updates (₹100 per file)
- [x] Display dynamic buffer pool amount that persists until hot reload

## Followup Steps
- [ ] Test app functionality
- [ ] Verify permissions and provider integrations
- [ ] Check UI consistency
