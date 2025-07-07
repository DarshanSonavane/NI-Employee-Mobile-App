String getImagePathFromKey(String key) {
  return 'assets/png_image/${key.replaceAll(" ", "_").toLowerCase()}';
}
