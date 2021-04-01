---
to: ui/src/components/uploader.js
sh: cd ui && pnpm install react-dropzone-uploader
---
import React from 'react';
import Dropzone from "react-dropzone-uploader";
import {getPresignedPost} from "../helpers/api";
import 'react-dropzone-uploader/dist/styles.css'


function Uploader(){
  // specify upload params and url for your files
  const getUploadParams = async ({ meta: { name } }) => {
    const { fields, url } = await getPresignedPost(name)
    let fileUrl = url+fields.key
    return { fields, meta: { fileUrl }, url }
  }

  // called every time a file's `status` changes
  const handleChangeStatus = (file, status) => {
    console.log(status, file.meta, file)
    if (status === 'done'){
      console.log("File has been uploaded")
      file.remove()
    }

  }

  return (
    <Dropzone
      getUploadParams={getUploadParams}
      onChangeStatus={handleChangeStatus}
    />
  )

}


export default Uploader;